// 이코테 구현 게임 개발

// N * M 크기의 직사각형 맵
// 캐릭터는 동/서/남/북 중 한 방향을 바라본다
// 맵의 각 칸 (A, B)
// A: 북쪽으로부터 떨어진 칸의 개수
// B: 서쪽으로부터 떨어진 칸의 개수

// 현재 위치의 현재 방향 기준, 왼쪽(반시계 90도 회전)부터 갈 곳을 정한다
// 가보지 않은 칸이라면, 왼쪽 방향으로 회전한 후 한 칸 전진
// 가 본 칸이라면, 왼쪽 방향으로 회전

// 네 방향 모두 갈 수 없다면(가본 칸 또는 바다)
// 바라보는 방향을 유지한 채로 한 칸 뒤로 간다

import Foundation

let mapsize = readLine()!.split(separator: " ").map { Int($0)! }
let n = mapsize[0]
let m = mapsize[1]

let player = readLine()!.split(separator: " ").map { Int($0)! }
var start = (x: player[0] - 1, y: player[1] - 1, dir: player[2])
// [x, y]

var map = Array(repeating: [Int](), count : m)

for i in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    map[i].append(contentsOf: input)
}

var visited = Array(repeating: Array(repeating: false, count: n), count: m)
visited[start.x][start.y] = true

var count = 0
// rotate
// move

func turnLeft() {
    start.dir -= 1
    
    if start.dir == -1 {
        start.dir = 3
    }
}

// 북 동 남 서
// 0 1 2 3
var dx = [-1, 0, 1, 0]
var dy = [0, 1, 0, -1]

var rotation = 0

while true {
    turnLeft()
    
    var nx = start.x + dx[start.dir]
    var ny = start.y + dy[start.dir]
    
    if nx >= 0 && nx < m && ny >= 0 && ny < n && visited[nx][ny] == false && map[nx][ny] == 0 {
        visited[nx][ny] = true
        count += 1
        start.x = nx
        start.y = ny
    } else {
        rotation += 1
    }
    
    if rotation == 4  {
        nx = start.x - dx[start.dir]
        ny = start.y - dy[start.dir]
        
        if nx >= 0 && nx < m && ny >= 0 && ny < n {
            start.x = nx
            start.y = ny
        } else {
            break
        }
        
        rotation = 0
    }
}

print(count)
