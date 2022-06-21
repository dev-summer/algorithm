// Programmers 84512 모음사전

// 모음사전을 모두 완성한 뒤 인덱스 값 + 1 리턴?

import Foundation

func solution(_ word: String) -> Int {
    let vowels = ["A", "E", "I", "O", "U"]
    var dict: Array<String> = []
    
    func makeWord(str: String) {
        var temp = str
        print(str, str.count)
        if temp.count == 5 {
            temp = ""
            return
        }
        // e
        for i in vowels {
//            print(i)
            temp.append(i)
//            print("str: \(temp)")
            if !dict.contains(temp) && temp.count <= 5 {
                dict.append(temp)
                makeWord(str: temp)
            }
            // aaaaa
            // aaaa
            temp.removeLast()
        }
    }
    
    makeWord(str: "")
    
    var idx = 0
    
    // 단순 선형 탐색
    for i in 0..<dict.count {
        if dict[i] == word {
            idx = i + 1
        }
    }
    
    return idx
}

print(solution("E"))
print()

let aaa = "aaa"
print(aaa.first)
print(type(of: aaa.first))
print(String(aaa.first!))
