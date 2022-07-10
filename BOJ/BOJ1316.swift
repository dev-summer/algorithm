// BOJ 1316 그룹 단어 체커

import Foundation

let size = Int(readLine()!)!
var result = 0

for _ in 0..<size {
    let input = Array(readLine()!)
    var history = [Character]()
    for i in 0..<input.count {
        if !history.contains(input[i]) || history.last == input[i] {
            history.append(input[i])
        } else {
            break
        }
        if i == input.count - 1 {
            result += 1
        }
    }
}

print(result)
