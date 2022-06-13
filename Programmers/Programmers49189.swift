// Programmers 49189

import Foundation

// BFS
func solution(_ n: Int, _ edge: [[Int]]) -> Int {
    var graph = Array(repeating: [Int](), count: n + 1)
    
    // 인접 리스트 생성
    for i in edge {
        graph[i[0]].append(i[1])
        graph[i[1]].append(i[0])
    }
    
    var distance = Array(repeating: 0, count: n + 1)
    var queue = [Int]()
    
    func bfs(index: Int) {
        queue.append(index)
        var now = 0
        
        while now != queue.count {
            let cur = queue[now]
            now += 1
            print("queue: \(queue)")
            print("cur: \(cur), now: \(now)")
            print("distance: \(distance)")
            // graph[0] = [2, 3]
            for v in graph[cur] {
                if distance[v] == 0 && v != index {
                    distance[v] = distance[cur] + 1
                    queue.append(v)
                }
            }
        }
    }
    
    bfs(index: 1)
    
    let max = distance.max()
    let result = distance.filter { $0 == max }
    
    return result.count
}


// DFS - 시간 초과
// 노드 개수가 1만개가 넘어가면 시간 초과가 날 확률이 높음
func solution(_ n: Int, _ edge: [[Int]]) -> Int {
    var graph = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
    for i in 0..<edge.count {
        let from = edge[i][0]
        let to = edge[i][1]
        graph[from][to] = 1
        graph[to][from] = 1
    }
    
    var visited = Array(repeating: false, count: n + 1)
    var distance = Array(repeating: 50000, count: n + 1)
    distance[1] = 0
    
    func dfs(index: Int, depth: Int) {
        visited[index] = true
        
        for i in 1...n {
            if visited[i] == false && graph[index][i] == 1 {
                let cost = depth + 1
                if distance[i] > cost {
                    distance[i] = cost
                }
                dfs(index: i, depth: cost)
                visited[i] = false
            }
        }
    }
    
    dfs(index: 1, depth: 0)
    
    let max = distance.max()
    let result = distance.filter { $0 == max }
    
    return result.count
}

solution(6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]])

