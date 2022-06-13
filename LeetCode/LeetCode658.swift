// LeetCode 658 Find K Closest Elements
import Foundation

class Solution {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var left = 0
        var right = arr.count - k
        
        while left < right {
            let mid = (left + right) / 2
            if x - arr[mid] > arr[mid + k] - x {
                left = mid + 1
            } else {
                right = mid
            }
        }
        
        var result = [Int]()
        result.append(contentsOf: arr[left..<left+k])
        
        return result
    }
}
