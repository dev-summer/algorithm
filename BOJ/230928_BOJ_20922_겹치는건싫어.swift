// 같은 원소가 k개 이하로 들어있는 최장 연속 부분수열

let input: [Int] = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
let n = input[0] // 수열의 총 길이
let k = input[1] // 최대 중복 가능
let numbers = readLine()!.split(separator: " ").compactMap { Int(String($0))! }

func solution() -> Int {
    var answer: Int = 0
    var start: Int = 0
    var end: Int = 0
    var count: [Int] = Array(repeating: 0, count: 100_001)
    
    while end < n {
        while true {
            if end == n { break }
            let cur = numbers[end]
            if count[cur] == k { break } // 이미 해당 숫자가 k번 나온 경우 멈춤
            count[cur] += 1
            end += 1
        }
        
        if end - start > answer {
            answer = end - start
        }
        
        let cur = numbers[start]
        count[cur] -= 1
        start += 1
    }
    
    
    return answer
}

print(solution())
