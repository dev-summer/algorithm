// 프로그래머스 42578 코딩테스트 연습 해시 위장

import Foundation

func solution(_ clothes: [[String]]) -> Int {
    var person = [String: [String]]()
    
    var partSet = Set<String>()
    
    for i in 0..<clothes.count {
        partSet.insert(clothes[i][1])
    }
    
    let partArray = Array(partSet)

    for arr in clothes {
        for i in 0..<partArray.count {
            if(arr[1] == partArray[i]) {
//                if(person[partArray[i]] == nil) {
//                    person.updateValue([arr[0]], forKey: partArray[i])
//                } else {
                    person[partArray[i], default: []].append(arr[0])
//                }
            }
        }
    }
    
    var combination: Int = 1
    
    for piece in person.keys {
        if(person[piece]!.count >= 1) {
            combination = combination * (person[piece]!.count + 1)
        }
    }
    
    print(combination - 1)
    return combination - 1
}
