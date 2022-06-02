// BOJ 1149 RGB거리

import Foundation

let N = Int(readLine()!)!
var arr = Array(repeating: [0, 0, 0], count: 1001)

for i in 1...N {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    arr[i][0] = input[0]
    arr[i][1] = input[1]
    arr[i][2] = input[2]
}

var costArr = Array(repeating: [0, 0, 0], count: 1001)

costArr[1][0] = arr[1][0]
costArr[1][1] = arr[1][1]
costArr[1][2] = arr[1][2]

for n in stride(from: 2, through: N, by: 1) {
    costArr[n][0] = min(costArr[n - 1][1], costArr[n - 1][2]) + arr[n][0]
    costArr[n][1] = min(costArr[n - 1][0], costArr[n - 1][2]) + arr[n][1]
    costArr[n][2] = min(costArr[n - 1][0], costArr[n - 1][1]) + arr[n][2]
}

print(arr)
print(costArr)

print(min(costArr[N][0], costArr[N][1], costArr[N][2]))
