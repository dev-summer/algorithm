import Foundation

func singleNumber(_ nums: [Int]) -> Int {
    var ans = 0
    for num in nums {
        print("before: ", num, ans)
        ans ^= num
        print("after: ", num, ans)
    }
    return ans
}

singleNumber([4,1,2,1,2])

func getMissing(_ arr: [Int], _ n: Int) -> Int {
    var a = arr[0]
    var b = 1
    
    for i in 1..<n {
        a ^= arr[i]
        print("a: \(a)")
    }
    
    for i in 2...n + 1 {
        b ^= i
        print("b: \(b)")
    }
    
    return a ^ b
}

print(getMissing([1, 2, 4, 6, 3, 7, 8], 7))
