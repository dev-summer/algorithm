// Programmers 92342 양궁대회
// 테스트케이스 24, 25 통과 못함

import Foundation

// 가장 큰 점수차이로 우승 & 가장 낮은 점수를 더 많이 맞힌 경우
func solution(_ n: Int, _ info: [Int]) -> [Int] {
    // 어피치가 n발을 모두 10점에 맞춘 경우 -> 최대 동점이므로 라이언 우승 불가
    if info[0] == n { return [-1] }
    

    var ryan = Array(repeating: 0, count: 11)
    var results = [[Int]]()
    var visited = Array(repeating: false, count: 11)
    
    func recur(index: Int, arrows: Int) {
        // 탈출조건
        if index == 10 {
            ryan[10] = arrows
            results.append(ryan)
            ryan[10] = 0
            return
        }
        
        if arrows == 0 {
            results.append(ryan)
            return
        }

        
        for i in index...10 {
            if visited[i] == false {
                visited[i] = true
                // 어피치가 i번째에 맞췄는지
                if arrows > info[i] {
                    // 쏘는 경우: 어피치보다 한발 더 쏨
                    ryan[i] = info[i] + 1
                    recur(index: index + 1, arrows: arrows - (info[i] + 1))
                    
                    // 리셋
                    ryan[i] = 0
                }
            }
            visited[i] = false
        }
    }
    
    recur(index: 0, arrows: n)
    
    var winningResults = [(numbers: [Int], gap: Int)]()
    var max = 0
    
    // 점수 비교
    for i in results {
        var apeachScore = 0
        var ryanScore = 0
        for j in 0...10 {
            if info[j] != 0 || i[j] != 0 {
                if info[j] >= i[j] {
                    apeachScore += (10 - j)
                } else {
                    ryanScore += (10 - j)
                }
            }
        }
        if ryanScore > apeachScore {
            winningResults.append((numbers: i, gap: ryanScore - apeachScore))
            if (ryanScore - apeachScore) > max {
                max = ryanScore - apeachScore
            }
        }
    }
    
    if winningResults.isEmpty { return [-1] }
    
    var maxResults = winningResults.filter { $0.gap == max }.map { $0.numbers }
    var unique = Array(Set(maxResults))
    
    var result = [Int]()

    if unique.count == 1 {
        result = unique[0]
    } else {
        for i in stride(from: 10, through: 0, by: -1) {
            let max = unique.map { $0[i] }.max()
            unique = unique.filter{ $0[i] == max }
        }
    }

    return unique[0]
}

print(solution(5, [2,1,1,1,0,0,0,0,0,0,0]))
