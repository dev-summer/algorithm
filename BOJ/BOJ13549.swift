//  BOJ 13549 숨바꼭질 3
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let k = input[1]

// 걷기: 1초, +1 또는 -1
// 순간이동: 0초, *2

var cost = Array(repeating: Int.max, count: 100001)
cost[n] = 0

var queue: [Int] = [n]
var front: Int = 0

while queue.count != front {
    let cur = queue[front]
    front += 1
    
    let tp = cur * 2
    let fw = cur + 1
    let back = cur - 1
    
    if tp <= 100000, cost[tp] > cost[cur] {
        cost[tp] = cost[cur]
        queue.append(tp)
    }
    
    if fw <= 10000, cost[fw] > cost[cur] + 1 {
        cost[fw] = cost[cur] + 1
        queue.append(fw)
    }
    
    if back >= 0, cost[back] > cost[cur] + 1 {
        cost[back] = cost[cur] + 1
        queue.append(back)
    }
}

print(cost[k])
