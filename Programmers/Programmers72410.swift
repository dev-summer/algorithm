// Programmers 72410 신규 아이디 추천

import Foundation

func solution(_ new_id: String) -> String {
    let no: Array<Character> = ["~", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "=", "+", "[", "{", "]", "}", ":", "?" , ",", "<", ">", "/"]

    // 1단계
    var conv = Array(new_id.lowercased())
    
    // 2단계
    var del: Array<Character> = []
    for char in conv {
        if no.contains(char) {
            continue
        } else {
            del.append(char)
        }
    }
    
    // 3단계
    var dot = [Character]()
    if del.count <= 1 {
        dot = del
    } else {
        for i in 0..<del.count - 1 {
            if del[i] == "." && del[i + 1] == "." {
                continue
            } else {
                dot.append(del[i])
            }
        }
    }
    
    if !dot.isEmpty && !del.isEmpty {
        if dot.last! == "." {
            if del.last! != "." {
                dot.append(del.last!)
            }
        } else {
            dot.append(del.last!)
        }
    }
    
    // 4단계
    if dot.count > 1 {
        if dot[0] == "." {
            dot.removeFirst()
        }
        if dot[dot.count - 1] == "." {
            dot.removeLast()
        }
    } else if dot.count == 1 {
        if dot[0] == "." {
            dot.removeFirst()
        }
    }
    
    // 5단계
    if dot.isEmpty {
        dot.append("a")
    }
    
    // 6단계
    var newArr = [Character]()
    if dot.count > 15 {
        newArr.append(contentsOf: dot[0...14])
    } else {
        newArr = dot
    }
    
    // 7단계
    if newArr.last == "." {
        newArr.removeLast()
    }
    
    // 8단계
    if newArr.count < 3 {
        while newArr.count < 3 {
            newArr.append(newArr.last!)
        }
    }
    
    let str = String(newArr)
    
    return str
}
