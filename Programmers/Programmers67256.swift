// Programmers 67256 키패드 누르기

import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    let keypad = [["1", "2", "3"],
                 ["4", "5", "6"],
                 ["7", "8", "9"],
                 ["*", "0", "0"]]
    
    var middle = [2, 5, 8, 0]
    var result = ""
    
    var left = (row: 3, col: 0)
    var right = (row: 3, col: 2)
    for num in numbers {
        if num == 1 || num == 4 || num == 7 {
            result.append("L")
            left.col = 0
            if num == 1 {
                left.row = 0
            } else if num == 4 {
                left.row = 1
            } else if num == 7 {
                left.row = 2
            }
        } else if num == 3 || num == 6 || num == 9 {
            result.append("R")
            right.col = 2
            if num == 3 {
                right.row = 0
            } else if num == 6 {
                right.row = 1
            } else if num == 9 {
                right.row = 2
            }
        } else {
            var cur = (row: 0, col: 1)
            if num == 2 {
                cur.row = 0
            } else if num == 5 {
                cur.row = 1
            } else if num == 8 {
                cur.row = 2
            } else if num == 0 {
                cur.row = 3
            }
            
            let leftDist = abs(left.row - cur.row) + abs(left.col - cur.col)
            let rightDist = abs(right.row - cur.row) + abs(right.col - cur.col)
            if leftDist < rightDist {
                left.row = cur.row
                left.col = cur.col
                result.append("L")
            } else if leftDist > rightDist {
                right.row = cur.row
                right.col = cur.col
                result.append("R")
            } else if leftDist == rightDist {
                if hand == "left" {
                    left.row = cur.row
                    left.col = cur.col
                    result.append("L")
                } else if hand == "right" {
                    right.row = cur.row
                    right.col = cur.col
                    result.append("R")
                }
            }
        }
    }
    return result
}
