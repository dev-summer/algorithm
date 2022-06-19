// Programmers 87946 피로도

// 완전 탐색(DFS?)으로 풀어야 하는 건 알겠는데.. 구현을 어떻게 해야할까

import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var visited = Array(repeating: false, count: dungeons.count)
    var max = 0
    
    func recur(index: Int, fatigue: Int, cleared: Int) {
        var f = fatigue
        var c = cleared
        visited[index] = true
        if fatigue >= dungeons[index][0] {
            f -= dungeons[index][1]
            c += 1
        }
        
        if c > max {
            max = c
        }
        
        print("visited: \(visited)")
        print("index: \(index), cleared: \(c)")
        
        for i in 0..<dungeons.count {
            if visited[i] == false && f >= dungeons[i][0] {
                print("i: \(i)")
                recur(index: i, fatigue: f, cleared: c)
                print("out, fatigue: \(f)")
            }
        }
        
        visited[index] = false
        print("to false, visited: \(visited)")
    }
    
    
    for i in 0..<dungeons.count {
        recur(index: i, fatigue: k, cleared: 0)
    }
    
    return max
}


print(solution(80, [[80,20],[50,40],[30,10]]))
