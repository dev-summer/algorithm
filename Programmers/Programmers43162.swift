// Programmers 43162 네트워크

import Foundation

// 양방향 그래프인 경우 (대칭)
func solution(_ n: Int, _ computers: [[Int]]) -> Int {
    // 경로(네트워크) 들을 담은 배열
    var network = [[Int]]()
    
    // 해당 노드를 방문했었는지 확인하는 배열
    var visited = Array(repeating: false, count: n)
    
    var count = 0
        
    func bfs(index: Int) {
        // 해당 노드와 인접한 노드들 중 방문할 노드들을 담은 큐
        var arr = [Int]()
        
        for i in index..<n {
            if visited[i] == false {
                for j in index..<n {
                    if computers[i][j] == 1 {
                        visited[i] = true
                        arr.append(j)
                    }
                }
                arr.removeFirst()
                if !arr.isEmpty { bfs(index: arr[0]) }
                if arr.isEmpty { count += 1 }
            }
        }
    }
    
    bfs(index: 0)
    return count
}

// 대칭이 아닌 그래프인 경우
func solution(_ n: Int, _ computers: [[Int]]) -> Int {
    
    var visited = Array(repeating: false, count: n)
    var count = 0
    
    func bfs(index: Int) {
        visited[index] = true
        
        for i in 0..<n {
            if computers[index][i] == 1 && visited[i] == false {
                bfs(index: i)
            }
        }
    }
    
    for i in 0..<n {
        if !visited[i] {
            count += 1
            bfs(index: i)
        }
    }
    
    return count
}


let answer = solution(5, [[1,1,0,0,0,1], [1, 1, 0,1,0,0], [0, 0, 1,0,1,0], [0,1,0,1,0,0], [0,0,1,0,1,0], [1,0,0,0,0,1]])
print(answer)

