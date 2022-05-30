// BOJ 1182 부분수열의 합
// 부분수열: 주여진 수열의 일부 항을 원래 순서대로 나열하여 얻을 수 있는 수열

import Foundation

var inputNS = readLine()!
var condition = inputNS.components(separatedBy: " ").compactMap { Int($0) }
var sizeN = condition[0]
var targetS = condition[1]
var numbers = readLine()!.components(separatedBy: " ").compactMap { Int($0) }

var visited = Array(repeating: false, count: 21)

var count = 0
var sum = 0

func dfs(_ depth: Int, _ start: Int) {
    print("depth: \(depth)")
    if sum == targetS && depth >= 1 {
        count += 1
    }

    // depth = 마지막 index + 1 에 도달할 경우
    // 모든 i에 대해 visited[i] == true이기 때문에
    // 안쪽 dfs함수가 끝나고 바깥쪽 dfs함수의 dfs() 다음 구문이 실행된다
    // 마지막 index + 1 에 도달하기 전까지 계속 안으로 들어가는 형태이기 때문에
    // sum -= numbers[i]의 i는 바로 바깥쪽(이전) index
    for i in start..<sizeN {
        if visited[i] == false {
            print("i: \(i), start: \(start)")
            print("visited[i]: \(visited[i]), sum: \(sum), numbers[i]: \(numbers[i])")
            visited[i] = true
            sum += numbers[i]
            print("sum1: \(sum)")
            dfs(depth + 1, i)
            print("sum2: \(sum), numbers[i]: \(numbers[i])")
            print("depth: \(depth)")
            visited[i] = false
            sum -= numbers[i]
            print("sum3: \(sum)")
            print("i: \(i), start: \(start)")
            print("visited[i]: \(visited[i]), numbers[i]: \(numbers[i])")
        }
    }
}

dfs(0, 0)
print(count)
