// LeetCode 9 Palindrome Number

import Foundation

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        var number = x
        var result = false
        if x < 0 || x % 10 == 0 { result = false }
        
        var rev = 0
        
        while number > 0 {
            rev = rev * 10 + number % 10
            number /= 10
        }
        
        if rev == x {
            result = true
        } else {
            result = false
        }
        
        return result
    }
}
