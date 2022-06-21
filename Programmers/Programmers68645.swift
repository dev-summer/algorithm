// Programmers 68645 삼각 달팽이

import Foundation

func solution(_ n:Int) -> [Int] {
    var triangle = Array(repeating: [Int](), count: n)
    
    var end = 0
    for i in 1...n {
        end += i
    }
    
    var down = 1
    for idx in 1...n {
        if idx % 3 == 1 {
            appendDown(&triangle, down, n - (idx - 1), (idx / 3) * 2)
            down += (n - 3 * (idx / 3)) + (n - 3 * (idx / 3) - 1) + (n - 3 * (idx / 3) - 2)
        }
    }
    
    
    var right = 1 + n
    for idx in 1...n {
        if idx % 3 == 2 {
            appendRight(&triangle, right, n - (idx - 1), (n - 1) - (idx / 3))
            right += (n - 3 * (idx / 3) - 1) + (n - 3 * (idx / 3) - 2) + (n - 3 * (idx / 3) - 3)
        }
    }
    
    var up = 2 * n
    var upArr = Array(repeating: [Int](), count: n)
    for idx in 1...n {
        if idx % 3 == 0 {
            appendUp(&upArr, up, n - (idx - 1), (n - 1) - (idx / 3))
            up += (n - (3 * (idx / 3) - 1)) + (n - (3 * (idx / 3) - 1) - 1) + (n - (3 * (idx / 3) - 1) - 2)
        }
    }
    
    for i in 0..<n {
        while !upArr[i].isEmpty {
            triangle[i].append(upArr[i].removeLast())
        }
    }
    
    let result = triangle.flatMap { $0 }
    return result
}

func appendDown(_ graph: inout [[Int]], _ start: Int, _ many: Int, _ row: Int) {
    for i in 0..<many {
        graph[row + i].append(start + i)
    }
}

func appendRight(_ graph: inout [[Int]], _ start: Int, _ many: Int, _ row: Int) {
    for i in 0..<many {
        graph[row].append(start + i)
    }
}

// 바깥쪽이 아니라 안쪽부터 붙여나가야 함 -> 배열을 만든 후 역순으로 붙여 나가기
func appendUp(_ graph: inout [[Int]], _ start: Int, _ many: Int, _ row: Int) {
    for i in 0..<many {
        graph[row - i].append(start + i)
    }
}

solution(1)

