// 이코테 그리디 1이 될 때까지
import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
var n = input[0]
let k = input[1]

var cal = 0

func check(number: Int) -> Bool {
    if number == 1 {
        return true
    } else {
        return false
    }
}

while !check(number:n) {
    if n % k == 0 {
        n /= k
        cal += 1
    } else {
        n -= 1
        cal += 1
    }
}

print(cal)
