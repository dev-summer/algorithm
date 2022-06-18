// Programmers 92335 k진수에서 소수 개수 구하기

import Foundation

func solution(_ n: Int, _ k: Int) -> Int {
    
    func prime(_ number: Int) -> Bool {
        if number == 0 || number == 1 { return false }
        var index = 2
        while index * index <= number {
            if number % index == 0 { return false }
            index += 1
        }
        return true
    }
    
    // k진수로 변환
    let convertedStr = String(n, radix: k)
    
    // 0을 포함하지 않은 수들을 담을 배열
    let numbers = convertedStr.split(separator: "0").map { Int($0)! }
    
    var primes = 0
    
    for i in 0..<numbers.count {
        if prime(numbers[i]) { primes += 1 }
    }
    
    return primes
}

print("test:", solution(797161, 3))



let num = 437674
let conv = String(num, radix: 3)

print(conv)

let narr = Array(conv)
print(narr)
