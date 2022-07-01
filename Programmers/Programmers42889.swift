// Programmers 42889 실패율

import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var failureRate = Array(repeating: (stage: 0, rate: 0.0), count: N + 1)
    var stages = stages
    stages.sort { $0 < $1 }
    
    var arr = Array(repeating: 0, count: N + 2)
    
    // 1번 인덱스: 1번 스테이지에 멈춰있는 사람의 수
    for stage in stages {
        arr[stage] += 1
    }
    
    var div = stages.count
    for i in 1..<arr.count {
        if i != N + 1 {
            failureRate[i].stage = i
            failureRate[i].rate = Double(arr[i]) / Double(div)
            div -= arr[i]
        }
    }
    
    failureRate.removeFirst()
    failureRate.sort { $0.rate > $1.rate }
    
    print(failureRate)
    
    var result: Array<Int> = []
    for i in failureRate {
        result.append(i.stage)
    }
    
    return result
}

