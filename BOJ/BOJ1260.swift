// BOJ 1260 DFS와 BFS

import Foundation

let NMV = readLine()!.components(separatedBy: " ").map { Int($0)! }
let N = NMV[0]
let M = NMV[1]
let V = NMV[2]

var graph = Array(repeating: Array(repeating: 0, count: N + 1), count: N + 1)

for _ in 0..<M {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    graph[input[0]][input[1]] = 1
    graph[input[1]][input[0]] = 1
}


// DFS

var visitedDFS = Array(repeating: false, count: N + 1)

func dfs(index: Int) {
    visitedDFS[index] = true
    print(index, terminator: " ")

    for i in 1...N {
        if visitedDFS[i] == false && graph[index][i] == 1 {
            dfs(index: i)
        }
    }
}

dfs(index: V)
print()

// BFS
var visitedBFS = Array(repeating: false, count: N + 1)
var queue = [Int]()


func bfs(index: Int) {
    if visitedBFS[index] == true { return }
    visitedBFS[index] = true
    print(index, terminator: " ")

    for i in 1...N {
        if visitedBFS[i] == false && graph[index][i] == 1 {
            // 중복조건을 확인하지 않을 시, queue에 있는 element 중
            // 아직 !visited인 element가 중복으로 queue에 삽입된다
            if !queue.contains(i) {
                queue.append(i)
            }
        }
    }
    if queue.isEmpty { return }
    bfs(index: queue.removeFirst())
}

bfs(index: V)
