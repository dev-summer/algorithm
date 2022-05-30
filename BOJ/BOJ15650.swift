// BOJ 15650 N과 M (2)
// 1부터 N까지 자연수 중에서 중복 없이 M개를 고른 수열
// 고른 수열은 반드시 오름차순
// 1 <= M <= N <= 8

import Foundation

let NM = readLine()!.components(separatedBy: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]

var arr = [[Int]]()
var temp = [Int]()

func recur(count: Int, index: Int) {
    print("to append? \(temp), index: \(index)")
    if temp.count == M {
        arr.append(temp)
        print("arr: \(arr)")
        return
    } else if temp.count > M { return }
    if index > N { return }
    
    for i in index...N {
        print("i: \(i), index: \(index)")
        temp.append(i)
        recur(count: count + 1, index: i + 1)
        print("index: \(index), temp: \(temp)")
        temp.removeLast()
    }
}

recur(count: 0, index: 1)

for i in 0..<arr.count {
    for j in 0..<M {
        print(arr[i][j], terminator: " ")
    }
    print()
}
