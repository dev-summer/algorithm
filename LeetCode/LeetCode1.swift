// LeetCode 1 Two Sum

import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result: Array<Int> = []
        
        for i in 0..<nums.count {
            for j in (i+1)..<nums.count {
                if nums[i] + nums[j] == target {
                    result.append(i)
                    result.append(j)
                }
            }
        }
        
        return result
    }
}
