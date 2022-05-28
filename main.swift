// BOJ 2798 블랙잭

import Foundation

let input = readLine()!.components(separatedBy: " ").compactMap { Int($0) }

let cardCount = input[0]
let target = input[1]

let cards = readLine()!.components(separatedBy: " ").compactMap { Int($0) }

func permutation(_ arr: [Int], _ r: Int, _ result: inout [[Int]], _ index: Int = 0) {
    var arr = arr

    if index == r {
        result.append(Array(arr[0..<r]))
        return
    }

    for i in index..<arr.count {
        arr.swapAt(i, index)
        permutation(arr, r, &result, index + 1)
        arr.swapAt(i, index)
    }
}

var result = [[Int]]()
permutation(cards, 3, &result)

var sums = [Int]()
for i in 0..<result.count {
    sums.append(result[i].reduce(0, {$0 + $1}))
}

var closest = 100
var minGap = 300000
var sum = 0

for i in 0..<sums.count {
    var gap = target - sums[i]
    if gap >= 0 && gap < minGap {
        minGap = gap
        sum = sums[i]
    }
    if gap == 0 { break }
}

print(sum)
