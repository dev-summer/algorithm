// BOJ 1260 복습

import Foundation

let NMV = readLine()!.components(separatedBy: " ").map { Int($0)! }
let N = NMV[0]
let M = NMV[1]
let V = NMV[2]

var graph = Array(repeating: [Int](), count: N + 1)

for _ in 1...M {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let from = input[0]
    let to = input[1]
    graph[from].append(to)
    graph[to].append(from)
}

for i in 0...N {
    graph[i].sort()
}

var visited = Array(repeating: false, count: N + 1)
func dfs(index: Int) {
    print(index, terminator: " ")
    visited[index] = true
    
    for i in 0..<graph[index].count {
        let next = graph[index][i]
        if visited[next] == false {
            dfs(index: next)
        }
    }
    
}

dfs(index: V)
print()

for i in 0...N {
    visited[i] = false
}

var queue = [Int]()

func bfs(index: Int) {
    print(index, terminator: " ")
    visited[index] = true
    
    for i in 0..<graph[index].count {
        if visited[graph[index][i]] == false && !queue.contains(graph[index][i]) {
            queue.append(graph[index][i])
        }
    }
    if !queue.isEmpty {
        bfs(index: queue.removeFirst())
    }
}

bfs(index: V)
