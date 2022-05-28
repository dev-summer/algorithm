// 프로그래머스 42839 소수 찾기

import Foundation

func solution(_ numbers: String) -> Int {
    // String의 각 원소(?)를 String으로 만들고, 그 String을 Int로 변환
    // compactMap: 1차원 배열의 각 원소들에서 nil을 제거 후 옵셔널 바인딩한 값을 새로운 배열에 넣음
    var arr = numbers.compactMap { Int(String($0)) }
    
    // 소수 확인
    func primeNumber(_ number: Int) -> Bool {
        var divisor = 0
        if number == 0 || number == 1 { return false }
        for i in 2..<number {
            if number % i == 0 {
                divisor += 1
            }
        }
        
        if divisor == 0 { return true }
        else { return false }
    }

    // 모든 경우의 수를 [[Int]] 형태로 만든다
    func permutation(_ arr: [Int], _ r: Int, _ result: inout [[Int]], _ index: Int = 0) {
        if index == r {
            result.append(Array(arr[0..<r]))
            return
        }
        
        var arr = arr
        
        for i in index..<arr.count {
            arr.swapAt(i, index)
            permutation(arr, r, &result, index + 1)
            arr.swapAt(i, index)
        }
    }
    
    // 모든 부분순열을 담는 배열
    var result = [[Int]]()

    for r in 1...arr.count {
        permutation(arr, r, &result)
    }
    print("result: \(result)")
    
    var combinedArr = [Int]()
    // result의 각 배열 원소들을 배열에서 하나의 Int로 변환
    for i in 0..<result.count {
        let joinedNumber = result[i].reduce(0, { $0 * 10 + $1 })
        combinedArr.append(joinedNumber)
    }
    print("combinedArr: \(combinedArr)")
    
    // Set을 이용해 중복값 제거
    let uniqueResult = Set(combinedArr)
    print("uniqueResult: \(uniqueResult)")

    var primeNumbers = 0
    
    for i in uniqueResult {
        if primeNumber(i) == true { primeNumbers += 1 }
    }
    
    return primeNumbers
}

var number = "011"
print(solution(number))
