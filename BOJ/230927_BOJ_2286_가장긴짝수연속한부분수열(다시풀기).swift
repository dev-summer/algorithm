// 22862 가장 긴 짝수 연속한 부분 수열
// 시작 12:20

// 길이가 n인 수열, 1 이상인 정수로 구성
// 원하는 위치에 있는 수를 골라 최대 k번 삭제 가능
// 삭제 후 짝수로 이루어진 연속한 부분 수열 중 가장 긴 길이

let input: [Int] = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
let n = input[0] // 수열의 길이
let k = input[1] // 삭제할 수 있는 개수
let numbers = readLine()!.split(separator: " ").compactMap { Int(String($0))! }

// 맨 앞에서부터 홀수를 k개 삭제
// 삭제 후 짝수를 세어나간다.
// 짝수를 세기 시작하는 지점: 지웠던 홀수를 되살린 index 바로 다음 짝수부터

func solution() -> Int {
    var start: Int = 0
    var end: Int = 0
    var deleted: Int = 0
    var answer: Int = 0
    
    while end < n {
        while deleted <= k {
            deleted += numbers[end] % 2
            end += 1
            if end == n { break }
        }
        
        if end - start - deleted > answer {
            answer = end - start - deleted
        }
        
        while deleted > k {
            deleted -= numbers[start] % 2
            start += 1
        }
    }
    
    return answer
}

print(solution())
