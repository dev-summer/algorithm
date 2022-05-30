// BOJ 15649 N과 M (1)
// 자연수 N과 M이 주어졌을 때, 1부터 N까지 자연수 중에서 중복 없이 M개를 고른 수열
// 1 <= M <= 8

import Foundation

fileprivate let NM = readLine()!.components(separatedBy: " ").map { Int($0)! }

let N = NM[0]
let M = NM[1]

var arr = [[Int]]()
var visited = Array(repeating: false, count: N + 1)
var temp = [Int]()

func sol(count: Int, temp: inout [Int]) {
    if count == M {
        arr.append(temp)
        return
    }
    
    var index = 1
    for i in 1...N {
        if visited[index] == false {
            visited[index] = true
            temp.append(i)
//            print(visited)
//            print("i: \(i), temp: \(temp)")
            sol(count: count + 1, temp: &temp)
//            print("remove: \(i)")
            temp.removeLast()
            visited[index] = false
        }
        index = index + 1
    }
}

sol(count: 0, temp: &temp)
for i in 0..<arr.count {
    for j in 0..<M {
        print(arr[i][j], terminator: " ")
    }
    print("")
}
