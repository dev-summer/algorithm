// 프로그래머스 42587

import Foundation

func solution(_ priorities: [Int], _ location: Int) -> Int {
    var printedAt = 0
    
    // (최초index, 값)의 배열 생성
    var indexedArr = [(Int, Int)]()
    for i in 0..<priorities.count {
        indexedArr.append((i, priorities[i]))
    }

    while !indexedArr.isEmpty {
        // 현재 (index, 값)의 배열 중 값이 가장 큰 tuple을 찾아서
        // 그 tuple의 값을 mostValue에 할당
        let most = indexedArr.max { $0.1 < $1.1 }
        let mostValue = most!.1
        
        if(indexedArr[0].1 < mostValue) {
            var temp = (0, 0)
            temp = indexedArr[0]
            indexedArr.removeFirst()
            indexedArr.append(temp)
        } else {
            if(indexedArr[0].0 == location) {
                printedAt += 1
                indexedArr.removeFirst()
                break
            } else {
                printedAt += 1
                indexedArr.removeFirst()
            }
        }
    }
    
    return printedAt
}
