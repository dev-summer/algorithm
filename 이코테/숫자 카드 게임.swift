// 이코테 그리디 숫자 카드 게임

// N행 M열
// 선택한 행의 가장 낮은 숫자를 뽑는다
// 가장 높은 숫자가 뽑힐 수 있도록 행을 선택한다

import Foundation

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]

var cards = Array(repeating: [Int](), count: N)
var min = Array(repeating: 0, count: N)

for i in 0..<N {
    cards[i].append(contentsOf: readLine()!.split(separator: " ").map { Int($0)! })
    min[i] = cards[i].min()!
}

print(min.max()!)
