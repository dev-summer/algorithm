// Programmers 64601 크레인 인형뽑기 게임
import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    let size = board.count
    var stack: Array<Int> = []
    var visited = Array(repeating: Array(repeating: false, count: size), count: size)
    var result = 0
    
    for move in moves {
        var i = 0
        while i < size {
            if visited[i][move - 1] == true {
                i += 1
                continue
            }
            visited[i][move - 1] = true
            if board[i][move - 1] != 0 {
                stack.append(board[i][move - 1])
                if stack.count > 1 {
                    if stack[stack.count - 1] == stack[stack.count - 2] {
                        stack.removeLast()
                        stack.removeLast()
                        result += 2
                    }
                }
                i += 1
                break
            } else if board[i][move - 1] == 0 {
                i += 1
                continue
            }
        }
    }
    
    return result
}
