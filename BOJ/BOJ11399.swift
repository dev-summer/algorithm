// BOJ 11399 ATM

import Foundation

fileprivate var size = Int(readLine()!)!
fileprivate var load = readLine()!.components(separatedBy: " ").map { Int($0)! }

// (사람번호, 필요시간)
fileprivate var arr = [(Int, Int)]()

for i in 0..<load.count {
    arr.append((i, load[i]))
}
// 필요시간이 낮은 순서대로 (오름차순) 정렬
arr.sort(by: { $0.1 < $1.1 } )

// 총 시간의 합
fileprivate var sum = 0

for i in 0..<arr.count {
    var waited = 0
    if i > 0 {
        for j in stride(from: i - 1, through: 0, by: -1) {
            waited += arr[j].1
        }
    }
    sum += waited + arr[i].1
}

print(sum)
