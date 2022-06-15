// BOJ 10815 숫자 카드

import Foundation

let n = Int(readLine()!)!
var cards = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }

var result = Array(repeating: 0, count: m)

cards.sort()

func recur(start: Int, end: Int, index: Int) {
    let mid = (start + end) / 2
    
    if start > end { return }
    
    if numbers[index] == cards[mid] {
        result[index] = 1
        return
    } else if numbers[index] < cards[mid] {
        recur(start: start, end: mid - 1, index: index)
    } else if numbers[index] > cards[mid] {
        recur(start: mid + 1, end: end, index: index)
    }
}

for i in 0..<m {
    recur(start: 0, end: n - 1, index: i)
}

for i in result {
    print(i, terminator: " ")
}
