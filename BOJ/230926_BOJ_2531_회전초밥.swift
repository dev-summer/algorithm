// 2531 회전 초밥
// 시작시간 12:32 ~ 13:10

// 같은 종류의 초밥 둘 이상
// 연속된 k개를 먹으면 할인된 정액
// 쿠폰과 동일한 초밥 하나 추가 무료 제공

// 가능한 다양한 종류의 초밥 먹기

let input: [Int] = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
let n = input[0] // 총 접시의 수
let d = input[1] // 초밥의 가짓수
let k = input[2] // 연속해서 먹는 접시의 수
let c = input[3] // 쿠폰번호
var sushi: [Int] = []

for _ in 0..<n {
    sushi.append(Int(readLine()!)!)
}

func solution() -> Int {
    var answer: Int = 0
    var currentSum: Int = 0
    var isChosen: [Int] = Array(repeating: 0, count: d)
    
    // 쿠폰 먼저 세고 시작
    isChosen[c - 1] += 1
    currentSum += 1
    
    // 맨 처음부터 k개의 접시 (0..<k)
    for i in 0..<k {
        let cur = sushi[i] - 1
        if isChosen[cur] == 0 { currentSum += 1 }
        isChosen[cur] += 1
    }
    
    // n == k일 경우 조기종료
    if n == k {
        return currentSum
    }
    
    for i in 0..<n {
        // i: 시작 인덱스 (제거할 인덱스)
        // front: 초밥 번호 - 1
        let front = sushi[i] - 1
        isChosen[front] -= 1
        if isChosen[front] == 0 { currentSum -= 1 }
        
        // end: 끝 인덱스 (추가할 인덱스)
        var end = k + i
        if end >= n { // 끝 인덱스가 배열 길이를 초과하면 앞으로 돌림
            end = end % n
        }
        
        // 끝 초밥번호 - 1
        let cur = sushi[end] - 1
        
        if isChosen[cur] == 0 { currentSum += 1 }
        isChosen[cur] += 1
        
        answer = currentSum > answer ? currentSum : answer
    }
    
    return answer
}

print(solution())
