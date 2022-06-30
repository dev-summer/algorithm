// Programmers 81301 숫자 문자열과 영단어

import Foundation

func solution(_ s:String) -> Int {
    var numbers = ""
    var stack = [Character]()
    var chartoNum: Dictionary<String, String> = ["zero": "0", "one": "1", "two": "2", "three": "3", "four": "4", "five": "5", "six": "6", "seven": "7", "eight": "8", "nine": "9"]
    
    for i in s {
        if let char = Int(String(i)) {
            numbers.append(i)
        } else {
            stack.append(i)
        }
        
        if !stack.isEmpty {
            var str = ""
            str.append(contentsOf: stack)
            for i in chartoNum.keys {
                if str == i {
                    numbers.append(chartoNum[i]!)
                    stack.removeAll()
                    continue
                }
            }
        }
    }

    return Int(numbers)!
}
