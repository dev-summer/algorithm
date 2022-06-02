// Leetcode 62 Unique Paths
// Runtime 0ms

import Foundation

class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: 101), count: 101)
        for i in 0..<n {
            for j in 0..<m {
                if i == 0 || j == 0 {
                    dp[i][j] = 1
                } else {
                    dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
                }
            }
        }
        
        return dp[n - 1][m - 1]
    }
}

let sol = Solution()
print(sol.uniquePaths(3, 7))
