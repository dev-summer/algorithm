// LeetCode 13 Roman to Integer

import Foundation

class Solution {
    func romanToInt(_ s: String) -> Int {
        let dic: Dictionary<Character, Int> = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
        
        let arr = Array(s)
        var last = arr.count - 1
        var result = 0
        
        for i in 0..<last {
            if dic[arr[i]]! >= dic[arr[i + 1]]! {
                result += dic[arr[i]]!
            } else {
                result -= dic[arr[i]]!
            }
        }
        
        result += dic[arr[last]]!
        
        return result
    }
}
