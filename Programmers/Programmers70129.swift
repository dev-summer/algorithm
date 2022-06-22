// Programmers 701029 이진 변환 반복하기

import Foundation

func solution(_ s:String) -> [Int] {
    var result = [0, 0]

    func recur(str: String, zeros: Int, count: Int) {
        if str == "1" {
            result[0] = count
            result[1] = zeros
            return
        }
        
        var zeros = zeros
        var ones = 0
        
        func removeZero(_ str: String) {
            var strArr = Array(str)
        
            for i in strArr {
                if i == "0" { zeros += 1 }
                if i == "1" { ones += 1 }
            }
        }
    
        func toBinary(_ number: Int) -> String {
            let binary = String(number, radix: 2)
            return binary
        }
    
        removeZero(str)
        let binary = toBinary(ones)
        
        recur(str: binary, zeros: zeros, count: count + 1)
    }
    
    recur(str: s, zeros: 0, count: 0)

    return result
}

