// Programmers 68935 3진법 뒤집기

import Foundation

func solution(_ n:Int) -> Int {
    let ternary = String(n, radix: 3)
    let reverse = String(ternary.reversed())
    
    let result = Int(reverse, radix: 3)!
    
    return result
}
