// BOJ 15651 N과 M (3)
// 중복 가능한 수열

import Foundation

let NM = readLine()!.components(separatedBy: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]

var temp = [Int]()

func recur(count: Int, index: Int) {
    if count == M {
        for i in 0..<M {
            print(temp[i], terminator: " ")
        }
        print()
        return
    }
    if index > N { return }

    for i in 1...N {
        temp.append(i)
        recur(count: count + 1, index: index + 1)
        temp.removeLast()
    }
}

recur(count: 0, index: 1)
