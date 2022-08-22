// Leetcode 62 Unique Paths
// Runtime 3ms

import Foundation

class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var path = Array(repeating: [Int](), count: m)
        for i in 0..<m {
            for _ in 0..<n {
                path[i].append(0)
            }
        }

        func recur(_ x: Int, _ y: Int) -> Int {
            if x == 0 || y == 0 {
                path[x][y] = 0
                return 1
            }
            if x == 1 && y == 1 {
                path[x][y] = 2
                return 2
            }
            if path[x][y] != 0 {
                return path[x][y]
            }
            
            while x >= 0 && y >= 0 {
                if x == 0 && y > 0 {
                    path[x][y] = recur(x, y -  1)
                } else if x > 0 && y == 0 {
                    path[x][y] = recur(x - 1, y)
                } else if x > 0 && y > 0 {
                    path[x][y] = recur(x - 1, y) + recur(x, y - 1)
                }
                return path[x][y]
            }
            return path[x][y]
        }
         
        let answer = recur(m - 1, n - 1)
        return answer
    }
}
