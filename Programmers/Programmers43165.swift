// Programmers 43165 타겟 넘버

import Foundation

func solution(_ numbers: [Int], _ target: Int) -> Int {
    var graph = Array(repeating: Array(repeating: 0, count: 2), count: numbers.count + 1)
    var visited = Array(repeating: false, count: numbers.count + 1)
    var sum = 0
    var count = 0
    
    for i in 0..<numbers.count {
        graph[i][0] = numbers[i]
        graph[i][1] = -numbers[i]
    }
    print(graph)
    
    func dfs(depth: Int) {
        if depth == numbers.count && sum == target {
            count += 1
        }
        if depth == numbers.count { return }
        
        for i in 0...depth {
            if visited[i] == false {
                visited[i] = true
                for j in 0..<2 {
                    sum += graph[i][j]
                    dfs(depth: depth + 1)
                    sum -= graph[i][j]
                }
                visited[i] = false
            }
            
        }
    }
    
    dfs(depth: 0)
    return count
}

print(solution([4, 1, 2, 1], 4))

