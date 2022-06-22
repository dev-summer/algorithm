// Programmers 68936 쿼드압축 후 개수 세기

import Foundation

func solution(_ arr:[[Int]]) -> [Int] {
    var result = [0, 0]
    
    func divide(_ arr: [[Int]]) {
        let size = arr.count
        
        if !merge(arr) {
            return
        }
        
        print(arr)
        var arr1 = Array(repeating: [Int](), count: size / 2)
        var arr2 = Array(repeating: [Int](), count: size / 2)
        var arr3 = Array(repeating: [Int](), count: size / 2)
        var arr4 = Array(repeating: [Int](), count: size / 2)
        
        for i in 0..<size {
            for j in 0..<size {
                if i < size / 2 && j < size / 2 {
                    arr1[i].append(arr[i][j])
                } else if i < size / 2 && j >= size / 2 {
                    arr2[i].append(arr[i][j])
                } else if i >= size / 2 && j < size / 2 {
                    arr3[i - size / 2].append(arr[i][j])
                } else if i >= size / 2 && j >= size / 2 {
                    arr4[i - size / 2].append(arr[i][j])
                }
            }
        }
        
        if merge(arr1) {
            divide(arr1)
        }
        if merge(arr2) {
            divide(arr2)
        }
        if merge(arr3) {
            divide(arr3)
        }
        if merge(arr4) {
            divide(arr4)
        }
    }
    
    func merge(_ arr: [[Int]]) -> Bool {
        let flat = arr.flatMap { $0 }
        
        if flat.contains(0) && flat.contains(1) {
            return true
        } else if !flat.contains(0) {
            result[1] += 1
            return false
        } else if !flat.contains(1) {
            result[0] += 1
            return false
        } else { return false }
    }
    
    divide(arr)
    
    return result
}

print(solution([[1,1,1,1,1,1,1,1],[0,1,1,1,1,1,1,1],[0,0,0,0,1,1,1,1],[0,1,0,0,1,1,1,1],[0,0,0,0,0,0,1,1],[0,0,0,0,0,0,0,1],[0,0,0,0,1,0,0,1],[0,0,0,0,1,1,1,1]]))

