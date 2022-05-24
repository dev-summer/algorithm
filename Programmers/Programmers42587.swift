// 프로그래머스 42587

import Foundation

func solution(_ priorities: [Int], _ location: Int) -> Int {
    var printedAt = 0
    
    // (i, priorities[i])
    // (최초index, 값)의 배열 생성
    var indexedArr = [(index: Int, value: Int)]()
    for i in 0..<priorities.count {
        indexedArr.append((i, priorities[i]))
    }

    while !indexedArr.isEmpty {
        // 현재 (index, 값)의 배열 중 값이 가장 큰 tuple을 찾아서
        // 그 tuple의 값을 mostValue에 할당
        let most = indexedArr.max { $0.value < $1.value }
        let mostValue = most!.1
        
        // 0번째 tuple의 두번째(?)원소의 값이 최댓값보다 작을 경우
        // 0번째 tuple을 배열의 맨 뒤로 보냄
        if (indexedArr[0].1 < mostValue) {
            var temp = (0, 0)
            temp = indexedArr[0]
            indexedArr.removeFirst()
            indexedArr.append(temp)
        } else {
            // 0번째 tuple의 두번째(?) 원소의 값 >= 최대값일 경우
            // 현재 0번째 tuple의 최초 index값이 location과 같은지 확인
            // (priorities의 원소 중 중복되는 값이 잇으므로)
            if (indexedArr[0].0 == location) {
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
