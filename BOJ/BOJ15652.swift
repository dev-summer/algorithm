// BOJ 15652 N과 M (4)

import Foundation

let NM = readLine()!.components(separatedBy: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]

var range = [Int]()

for i in 1...N {
    range.append(i)
}

var arr = [Int]()

func recur(index: Int) {
    if arr.count == M {
        for i in arr {
            print(i, terminator: " ")
        }
        print()
        return
    }
    
    for i in range {
        if i >= index {
            arr.append(i)
            recur(index: i)
            arr.removeLast()
        }
    }
}

recur(index: 1)

