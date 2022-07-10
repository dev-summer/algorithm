// 이코테 구현 왕실의 나이트

// 8 * 8 체스판
// 주어진 위치에서 나이트가 한 번 이동할 수 있는 경우의 수

import Foundation

let input = readLine()!

let dic: [Character: Int] = ["a": 0, "b": 1, "c": 2, "d": 3, "e": 4, "f": 5, "g": 6, "h": 7]
var cor: (row: Int, col: Int)
var count = 0

cor.row = dic[input.first!]!
cor.col = Int(String(input.last!))! - 1

let dx = [-2, -2, -1, -1, 2, 2, 1, 1]
let dy = [-1, 1, -2, 2, -1, 1, -2, 2]
let moves = ["LLU", "LLD", "LUU", "LDD", "RRU", "RRD", "RUU", "RDD"]
// moves배열은 결론적으로 사용되지 않으므로 필요가 없다.... (한 번만 이동하기 때문)
// tuple을 이용해서 dx, dy를 한번에 쓰는 것도 가능

for i in 0..<dx.count {
    let nr = cor.row + dx[i]
    let nc = cor.col + dy[i]
    
    if nr >= 0 && nr <= 7 && nc >= 0 && nc <= 7 {
        count += 1
    }
}

print(count)
