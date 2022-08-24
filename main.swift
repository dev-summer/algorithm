let num = 1

switch num {
case 1:
    print("1")
    fallthrough
case 2:
    print("2")
    fallthrough
default:
    print("def")
}


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
