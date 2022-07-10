// 이코테 그리디 큰 수의 법칙

// 다양한 수로 이루어진 배열에서, 주어진 수들을 M번 더하여 가장 큰 수를 만드는 법칙
// 배열의 특정한 인덱스에 해당하는 수가 연속해서 K번을 초과해 더해질 수 없다
// 인덱스가 다를 경우, 값이 같더라도 다른 것으로 간주한다

// 배열의 크기 N, 2 <= N <= 1000
// 숫자가 더해지는 횟수 M, 1 <= M <= 10000
// 1 <= K <= 10000

import Foundation

let NMK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NMK[0]
let M = NMK[1]
let K = NMK[2]

let numbers = readLine()!.split(separator: " ").map { Int($0)! }

var max = 1
var secondMax = 1

func getMax() {
    for i in 0..<numbers.count {
        if numbers[i] >= max {
            secondMax = max
            max = numbers[i]
        }
    }
}
// sorted()는 시간복잡도가 nlogn이라서 sorted()를 활용하면 더 빠르다

func cal() -> Int {
    var added = 0
    var repeated = 0
    var sum = 0
    
    while added < M {
        if repeated >= K {
            sum += secondMax
            added += 1
            repeated = 0
        } else {
            sum += max
            added += 1
            repeated += 1
        }
    }
    
    return sum
}

getMax()
print(cal())
