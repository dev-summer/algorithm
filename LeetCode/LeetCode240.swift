// LeetCode 240 Search a 2D Matrix II

import Foundation

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    if matrix.isEmpty || matrix[0].isEmpty { return false }
    
    let m = matrix.count
    let n = matrix[0].count
    
    var row = 0
    var col = n - 1
    
    while row < m && col >= 0 {
        if matrix[row][col] == target {
            return true
        }
        if matrix[row][col] > target {
            col -= 1
        } else {
            row += 1
        }
    }
    
    return false
}

searchMatrix([[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], 5)

