// Programmers 87377 교점에 별 만들기

// Ax + By + C = 0
// [A, B, C]

import Foundation

func solution(_ line: [[Int]]) -> [String] {
    var points = [(x: Int, y: Int)]()
    var point: (x: Int, y: Int)
    
    for i in 0..<line.count {
        for j in i + 1..<line.count {
            let p = line[i]
            let q = line[j]
            if (p[0] * q[1] - p[1] * q[0]) != 0 {
                if (p[1] * q[2] - p[2] * q[1]) % (p[0] * q[1] - p[1] * q[0]) == 0 &&
                    (p[2] * q[0] - p[0] * q[2]) % (p[0] * q[1] - p[1] * q[0]) == 0 {
                    point.x = (p[1] * q[2] - p[2] * q[1]) / (p[0] * q[1] - p[1] * q[0])
                    point.y = (p[2] * q[0] - p[0] * q[2]) / (p[0] * q[1] - p[1] * q[0])
                    points.append(point)
                }
            }
        }
    }
    
    print(points)
    
    let maxX = points.max { $0.x < $1.x }!
    let minX = points.min { $0.x < $1.x }!
    
    let right = maxX.x
    let left = minX.x
    
    let maxY = points.max { $0.y < $1.y }!
    let minY = points.min { $0.y < $1.y }!
    
    let top = maxY.y
    let bottom = minY.y
    
    let width = right - left
    let height = top - bottom
    
    // 2 1 0 -1 -2
    // 0을 포함하므로 가로/세로 길이에 +1 해야 한다
    var graph = Array(repeating: Array(repeating: ".", count: width + 1), count: height + 1)
        
    for point in points {
        print(point.x, point.y)
        // y값이 작을 수록 아래 row에 위치 (row값이 더 커짐)
        // 가장 꼭대기 y값은 0번 row에 위치
        let row = top - point.y
        let column = point.x - left
        print("row: \(row), column: \(column)")
        graph[row][column] = "*"
    }
    
    // [[".", "*", ], []]
    print(graph)

    // graph의 각 원소 배열을 joined해서 하나의 원소가 되는 배열 만듦
    return graph.map { $0.joined() }
}

solution([[2, -1, 4], [-2, -1, 4], [0, -1, 1], [5, -8, -12], [5, 8, 12]])
