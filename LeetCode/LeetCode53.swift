// LeetCode 53 Maximum Subarray

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var arr = Array(repeating: 0, count: nums.count)
        
        arr[0] = nums[0]
        var max = nums[0]
        
        for i in 1..<nums.count {
            arr[i] = nums[i] + (arr[i - 1] > 0 ? arr[i - 1] : 0)
            max = max > arr[i] ? max : arr[i]
        }
        
        return max
    }
}
