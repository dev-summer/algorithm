// BOJ 2606 바이러스

import Foundation

let size = Int(readLine()!)!
let pair = Int(readLine()!)!

var graph = Array(repeating: [Int](), count: size + 1)

for _ in 1...pair {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let from = input[0]
    let to = input[1]
    
    graph[from].append(to)
    graph[to].append(from)
}

var visited = [Int]()
var infected = 0

func dfs(index: Int) {
    visited.append(index)
    
    for i in 0..<graph[index].count {
        if !visited.contains(graph[index][i]) {
            infected += 1
            dfs(index: graph[index][i])
        }
    }
}

dfs(index: 1)
print(infected)

visited.removeAll()
infected = 0

func bfs(index: Int) {
    visited.append(index)
    var queue = [Int]()
    
    for i in 0..<graph[index].count {
        if !visited.contains(graph[index][i]) {
            queue.append(graph[index][i])
            infected += 1
            bfs(index: queue.removeFirst())
        }
    }
}

bfs(index: 1)
print(infected)
