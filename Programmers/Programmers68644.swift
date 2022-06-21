// Programmers 68644 두 개 뽑아서 더하기

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var results: Array<Int> = []
    
    for i in 0..<numbers.count - 1 {
        for j in i + 1..<numbers.count {
            let sum = numbers[i] + numbers[j]
            if !results.contains(sum) {
                results.append(sum)
            }
        }
    }
    
    results.sort { $0 < $1 }
    
    return results
}
