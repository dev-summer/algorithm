// 이코테 구현 시각

import Foundation

let n = Int(readLine()!)!
var count = 0

for h in 0...n {
    for m in 0..<60 {
        for s in 0..<60 {
            if String(h).contains("3") || String(m).contains("3") || String(s).contains("3") {
                count += 1
            }
        }
    }
}

print(count)
