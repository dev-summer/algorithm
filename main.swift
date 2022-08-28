
//let input = readLine()!.split(separator: " ").map { Int($0)! }
//let n = input[0]
//let r = input[1]
//let c = input[2]
//
//var size = 1
//for _ in 1...n {
//    size *= 2
//}

/*    v     v     v     v
   0  1  2  3  4  5  6  7
 0 0  1  4  5  16 17 20 21
 1 2  3  6  7  18 19 22 23 2^1 -1
 2 8  9  12 13 24 25 28 29 2^1
 3 10 11 14 15 26 27 30 31 2^2 -1
 4 32 33 36 37 48 49 52 53 2^2
 5                         2^3 - 3
 6                         2^3 - 2
 7                         2^3 - 1
 
 */

// 사각형 기준 2^n 단위로 1 -> 2 -> 3 -> 4 사분면 순서
//var count = 0
//func recur(_ x: Int, _ y: Int, _ d: Int) {
//    let max = 2 * d
//
//    if x > max || y > max {
//        count += max
//        recur(x, y, max)
//    } else {
//
//    }
//}
//
//recur(r, c, 1)
//
//var answer = 0
//func recur(_ x: Int, _ y: Int) {
//    print(x, y)
//    if x == r && y == c {
//        return
//    }
//
//    answer += 1
//    if y % 2 == 0 {
//        recur(x, y + 1)
//    } else {
//        if x % 2 == 0 {
//            recur(x + 1, y - 1)
//        } else {
//            // 둘 다 2^n - 1 이고, x == y 인 경우
//            if isSquare(x).0, isSquare(y).0, x == y {
//                recur(x - isSquare(x).1 + 1, y + 1)
//            }
//
//            // 둘 다 2^n - 1 이고, x > y 인 경우 (
//            if isSquare(x).0, isSquare(y).0, x > y {
//                recur(x - 1, y + 1)
//            }
//
//            // 둘 다 2^n - 1 이고, x < y 인 경우
//            // (1, 3) -> (2, 0) -3 (1, 7) -> (2, 4) -3
//            // (3, 7) -> (4, 0) -7
//            if isSquare(x).0, isSquare(y).0, x < y {
//                recur(x + 1, y - (2 * x + 1))
//            }
//
//            // y만 2^n - 1 인 경우
//            // (5, 1) -> (6, 2) +1 (5, 3) -> (6, 0) -3 (5, 7) -> (6, 4) -3
//            if !isSquare(x).0, isSquare(y).0 {
//                recur(x + 1, y - isSquare(x).1 + 1)
//            }
//
//            // (3, 5)
//            // (7, 5)
//            if isSquare(x).0, !isSquare(y).0 {
//                recur(x - 1, y + 1)
//            }
//
//            // (5, 5)
//            if !isSquare(x).0, !isSquare(y).0 {
//                recur(x - 1, y + 1)
//            }
//        }
//
//    }
//}
//
//func isSquare(_ num: Int) -> (Bool, Int) {
//    var doub = 1
//    var notDoub = 0
//    for _ in 1...n {
//        doub *= 2
//        if doub - 1 == num {
//            return (true, doub)
//        }
//        if doub - 1 > num {
//            notDoub = doub / 2
//            break
//        }
//    }
//
//    return (false, notDoub)
//}
//
//recur(0, 0)
//print(answer)

//rpStr1.forEach{ print($0) }

//import Foundation
//
//var targetSum = 0
//var q1 = [Int](), q2 = [Int]()
//var minCount = Int.max
//var limit = 0
//
//func getSum(_ arr: [Int]) -> Int {
//    let sum = arr.reduce(0, +)
//    return sum
//}
//
//// 시간초과
//// 매 선택 분기마다 큐1에서 뺄건지, 큐2에서 뺄건지 정한다
//// 1번 방법: 큐에 계속 붙여나가고, 시작 인덱스를 전달해서 썸 계산
//// 2번 방법: inout으로 어레이의 원소를 계속 변경해서 썸 계산
//// 탈출조건?
//func recur(_ arr1: inout [Int], _ arr2: inout [Int], _ sum1: Int, _ sum2: Int, _ count: Int) {
//    print(arr1, arr2, count)
//    if count > limit { return }
//    if arr1.isEmpty || arr2.isEmpty { return }
//
//    if targetSum == sum1 {
////        print(sum1, arr1, arr2, count)
//        if count < minCount {
//            minCount = count
//        }
//        return
//    }
//
//    if sum1 > sum2 {
//
//    } else {
//
//    }
//
//    var arr1Copy = arr1
//    let add1 = arr1[0]
//    arr2.append(arr1Copy.removeFirst())
//    recur(&arr1Copy, &arr2, sum1 - add1, sum2 + add1, count + 1)
//    arr2.removeLast()
//    var arr2Copy = arr2
//    let add2 = arr2[0]
//    arr1.append(arr2Copy.removeFirst())
//    recur(&arr1, &arr2Copy, sum1 + add2, sum2 - add2, count + 1)
//}
//
//func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
//    let sum1 = getSum(queue1)
//    let sum2 = getSum(queue2)
//    targetSum = (getSum(queue1) + getSum(queue2)) / 2
//    limit = (queue1.count) * 3
//    q1 = queue1
//    q2 = queue2
//
//    if targetSum == getSum(queue1) { return 0 }
//
//    recur(&q1, &q2, sum1, sum2, 0)
//
//    if minCount == Int.max {
//        return -1
//    }
//
//    return minCount
//}
//
//print(solution([1, 2, 1, 2], [1, 10, 1, 2]))


//import Foundation
//
//var distance = [Int]()
//var weakPoint = [Int]()
//var length = 0
//var wall = [Int]()
//
//
//// 시계방향, 반시계방향 모두 고려해야 함
//func findMax(_ friend: Int) {
//    var curSum = 0
//    var maxSum = 0
//    var maxInfo: (start: Int, sum: Int, dir: String) = (0, 0, "")
//    var start = 0
//
//    for end in 0..<length {
//        curSum += wall[end]
//
//        if curSum > maxSum {
//            maxSum = curSum
//            maxInfo = (start, maxSum, "clock")
//        }
//
//        if end >= friend {
//            curSum -= wall[start]
//            start += 1
//        }
//    }
//
//    curSum = 0
//    start = length - 1
//    var count = 0
//    // end가 0까지 가면 안됨! start가 0까지 가야함
//    for end in stride(from: length - 1, through: -friend + 1, by: -1) {
//        if end < 0 {
//            curSum += wall[end + length]
//        } else {
//            curSum += wall[end]
//        }
//        count += 1
//
//        if curSum > maxSum {
//            maxSum = curSum
//            maxInfo = (start, maxSum, "anti")
//        }
//
//        if count >= friend {
//            curSum -= wall[start]
//            start -= 1
//            count -= 1
//        }
//    }
//
//    print(maxInfo)
//    if maxInfo.dir == "clock" {
//        for i in maxInfo.start...maxInfo.start + friend {
//            if wall[i] == 1 {
//                wall[i] = 0
//            }
//        }
//    } else {
//        for i in maxInfo.start - friend...maxInfo.start {
//            print(maxInfo.start, friend)
//            print(i)
//            if wall[i] == 1 {
//                wall[i] = 0
//            }
//        }
//    }
//}
//
//
//func solution(_ n:Int, _ weak:[Int], _ dist:[Int]) -> Int {
//    distance = dist.sorted { $0 > $1 }
//    weakPoint = weak
//    length = n
//    wall = Array(repeating: 0, count: length)
//
//    for i in 0..<weakPoint.count {
//        wall[weakPoint[i]] += 1
//    }
//    print(wall)
//    var friends = 0
//    for friend in distance {
//        print(friend)
//        findMax(friend)
//        friends += 1
//        print(wall)
//        if !wall.contains(0) {
//            break
//        }
//    }
//
//    return friends
//}
//
//solution(12, [1, 5, 6, 10], [1, 2, 3, 4])

//import Foundation
//
//func timeToSec(_ time: String) -> Int {
//    var inSeconds = 0
//    let timeArr = time.split(separator: ":").map { Int($0)! }
//    inSeconds = timeArr[0] * 3600 + timeArr[1] * 60 + timeArr[2]
//
//    return inSeconds
//}
//
//var playTime = 0
//var advTime = 0
//var playArr = [Int]()
//var playSum = 0
//var answer = 0
//var answerTime = 0
//var curUser = -1
//var map = [(index: Int, users: Int)]()
//
//func fillMap() {
//    for i in 0...playTime {
//        if playArr[i] != curUser {
//            curUser = playArr[i]
//            map.append((index: i, users: curUser))
//        }
//    }
//}
//
//func calculate() -> Int {
//    var windowSum = 0
//    var maxSum = 0
//    var windowStart = 0
//
//    for windowEnd in 0...playTime {
//        windowSum += playArr[windowEnd]
//
//        if windowEnd >= advTime {
//            if windowSum > maxSum {
//                maxSum = windowSum
//                answerTime = windowStart
//            }
//            windowSum -= playArr[windowStart]
//            windowStart += 1
//        }
//    }
//
//    return maxSum
//}
//
//func secToTime(_ sec: Int) -> String {
//    var h = ""
//    var t = ""
//    var s = ""
//
//    if sec / 3600 >= 10 {
//        h = String(sec / 3600)
//    } else {
//        h = h + "0" + String(sec / 3600)
//    }
//
//    let remainder = sec % 3600
//    if remainder / 60 >= 10 {
//        t = String(remainder / 60)
//    } else {
//        t = t + "0" + String(remainder / 60)
//    }
//
//    if remainder % 60 >= 10 {
//        s = String(remainder % 60)
//    } else {
//        s = s + "0" + String(remainder % 60)
//    }
//
//    let time: String = h + ":" + t + ":" + s
//    return time
//}
//
//func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {
//    playTime = timeToSec(play_time)
//    advTime = timeToSec(adv_time)
//    playArr = Array(repeating: 0, count: playTime + 1)
//
//    for user in logs {
//        let userArr = user.split(separator: "-").map { String($0) }
//        let userStart = timeToSec(userArr[0])
//        let userEnd = timeToSec(userArr[1])
//
//        for i in userStart...userEnd {
//            playArr[i] += 1
//        }
//    }
//
//    fillMap()
//    answer = calculate()
//    let result = secToTime(answerTime)
//
////    print(result)
//    return result
//}
//
//solution("02:03:55", "00:14:15", ["01:20:15-01:45:14", "00:40:31-01:00:00", "00:25:50-00:48:29", "01:30:59-01:53:29", "01:37:44-02:02:30"])
////
//print(playArr[timeToSec("01:30:59")])
//print(playArr[timeToSec("01:45:14")])
//print(playArr[timeToSec("01:51:59")])
