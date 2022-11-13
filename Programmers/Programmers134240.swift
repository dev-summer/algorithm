// 프로그래머스 134240 푸드 파이트 대회

func solution(_ food:[Int]) -> String {
    var half: String = ""
    for i in 1..<food.count {
        let str = String(repeating: String(i), count: food[i] / 2)
        half += str
    }
    
    let rev = half.reversed()
    let answer = half + "0" + rev
    
    return answer
}

print(
    solution([1, 3, 4, 6])
)
