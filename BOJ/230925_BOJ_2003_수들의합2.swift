// 수들의 합 2
// https://www.acmicpc.net/problem/2003
// 시작 10:31 - 10:48

// n개의 수, n <= 10_000
// A[i] + A[i + 1] + ... + A[j-1] + A[j] = M이 되는 경우의 수
// 각 원소 <= 30_000

func solve() {
    let input: [Int] = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
    let numbers: [Int] = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
    let n: Int = input[0]
    let m: Int = input[1]
    
    var answer: Int = 0
    var start: Int = 0
    var sum: Int = 0
    sum += numbers[0]
    
    if sum == m { answer += 1 }

    for i in 1..<n {
        sum += numbers[i] // i번째 수를 더한다.
        
        while sum > m { // 초과한 경우 맨 앞의 수를 뺌
            sum -= numbers[start]
            start += 1
        }
        
        if sum == m { answer += 1 }
    }
    
    print(answer)
}

solve()
