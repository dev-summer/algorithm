// BOJ 11726 2xn 타일링

import Foundation

let n = Int(readLine()!)!

var dp = Array(repeating: 0, count: 1001)

dp[1] = 1
dp[2] = 2
for i in 3...n {
    dp[i] = dp[i - 1] + dp[i - 2]
}

print(dp[n])
