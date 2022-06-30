// Programmers 64065 튜플

import Foundation

func solution(_ s:String) -> [Int] {
    let setArr = Array(s)
    var sets = Array(repeating: [Int](), count: 501)
    var i = 0
    var dict = [(elements: Int, idx: Int)]()

    print(setArr)
    var number = ""
    for str in setArr {
        if str == "{" {
            continue
        } else if str == "," {
            if number != "" {
                sets[i].append(Int(number)!)
                number = ""
            }
            continue
        } else if str == "}" {
            if number != "" {
                sets[i].append(Int(number)!)
                number = ""
            }
            dict.append((elements: sets[i].count, idx: i))
            i += 1
            continue
        } else {
            number.append(str)
        }
    }
    
    print(sets)

    dict.sort { $0.elements < $1.elements }
    dict.removeFirst()

    var result = [Int]()

    for i in dict {
        for j in sets[i.idx] {
            if !result.contains(j) {
                result.append(j)
            }
        }
    }

    print(result)
    return result
}

solution("{{2},{2,1},{2,1,3},{2,1,3,4}}")
