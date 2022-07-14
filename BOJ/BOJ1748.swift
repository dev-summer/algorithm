// BOJ 1748 수 이어 쓰기 1

import Foundation

let number = Int(readLine()!)!
var result = 0

var div = 10
var digit = 1
var count = 1
func recur(_ number: Int) {
    while number >= digit {
        var add = 0
        if div <= number {
            add = div - digit
        } else {
            add = number % div - digit + 1
        }
        print(add)
        result += add * count
        div *= 10
        digit *= 10
        count += 1
    }
}

recur(number)
print(result)
