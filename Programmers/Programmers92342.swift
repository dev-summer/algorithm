// Programmers 92342 양궁대회
// 다른 사람 해답 참고해서 풀어보기

import Foundation

func solution(_ n: Int, _ info: [Int]) -> [Int] {
    
    var ryan = Array(repeating: 0, count: 11)
    
    func getGap(_ apeach: [Int], _ ryan: [Int]) -> Int {
        var gap = 0
        var apeachScore = 0
        var ryanScore = 0
        
        for i in 0...10 {
            if apeach[i] != 0 || ryan[i] != 0 {
                if apeach[i] >= ryan[i] {
                    apeachScore += (10 - i)
                } else {
                    ryanScore += (10 - i)
                }
            }
        }
        gap = ryanScore - apeachScore
        return gap
    }
    
    var maxGap = 0
    var maxWin = [[Int]]()
    
    func recur(index: Int, arrows: Int) {
        print("index: \(index), ryan: \(ryan)")
        if index == 10 || arrows == 0 {
            if arrows > 0 {
                ryan[10] = arrows
            }
            let newGap = getGap(info, ryan)
            if newGap > maxGap {
                maxGap = newGap
                maxWin.removeAll()
                maxWin.append(ryan)
            } else if newGap == maxGap {
                maxWin.append(ryan)
            }
            ryan[10] = 0
            return
        }
        
        if arrows > info[index] {
            ryan[index] = info[index] + 1
            recur(index: index + 1, arrows: arrows - (info[index] + 1))
            ryan[index] = 0
        }
        recur(index: index + 1, arrows: arrows)
    }
    
    recur(index: 0, arrows: n)
    
    if maxGap <= 0 { return [-1] }
    
    let maxWinReversed = maxWin.map { Array($0.reversed()) }
    
    print("maxWin: \(maxWin)")
    print("reversed: \(maxWinReversed)")
    
    var reversedAnswer = maxWinReversed[0]
    var max = 0
    for arr in maxWinReversed {
        let numberStr = arr.map { String($0) }.joined()
        let number = Int(numberStr)!
        if number > max {
            max = number
            reversedAnswer = arr
        }
    }
    
    let answer = Array(reversedAnswer.reversed())
    
    return answer
}

print(solution(9, [0,0,1,2,0,1,1,1,1,1,1]))
