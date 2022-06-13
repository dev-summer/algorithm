// BOJ 2805 나무 자르기

import Foundation

let NM = readLine()!.components(separatedBy: " ").map { Int($0)! }

// 나무의 수
let N = NM[0]
// 나무의 길이
let M = NM[1]

var tree = readLine()!.components(separatedBy: " ").map { Int($0)! }

var start = 0
var end = 2000000000
var height = 0

while start <= end {
    var total = 0
    print("height: \(height), total: \(total)")

    let mid = (start + end) / 2
    for i in 0..<N {
        if tree[i] > mid {
            total += tree[i] - mid
        }
    }

    if total < M {
        end = mid - 1
    } else {
        height = mid
        start = mid + 1
    }
}

print(height)
