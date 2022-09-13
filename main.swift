import Foundation




//// 수식 최대화
//let operators: [Character] = ["+", "-", "*"]
//var answer: Int64 = 0
//
//func findFirstNumber(_ idx: Int, _ equation: String) -> (number: Int64, count: Int) {
//    let charArr = Array(equation)
//    var number: Int64 = 0
//    var cnt = 0
//    var digit: Int64 = 1
//    for i in stride(from: idx - 1, through: 0, by: -1) {
//        if charArr[i].isNumber {
//            number += Int64(String(charArr[i]))! * digit
//            cnt += 1
//            digit *= 10
//        } else {
//            break
//        }
//    }
//
//    return (number, cnt)
//}
//
//func findSecondNumber(_ idx: Int, _ equation: String) -> (number: Int64, count: Int) {
//    let charArr = Array(equation)
//    var number: Int64 = 0
//    var cnt = 0
//    for i in idx + 1..<charArr.count {
//        if charArr[i].isNumber {
//            number = number * 10 + Int64(String(charArr[i]))!
//            cnt += 1
//        } else {
//            break
//        }
//    }
//
//    return (number, cnt)
//}
//
//func calculate(_ first: Int64, _ second: Int64, _ op: Character) -> [Character] {
//    var number: Int64 = 0
//    if op == "+" {
//        number = first + second
//    } else if op == "-" {
//        number = first - second
//    } else if op == "*" {
//        number = first * second
//    }
//
//    return Array(String(number))
//}
//
//func modifyStr(_ equation: String, _ op: Character, _ result: inout [Character], _ idx: inout Int) -> [Character] {
//    let charArr = Array(equation)
//    let curEq = String(result)
//    print(result)
//
//    while idx < charArr.count {
//        print(equation, idx, charArr[idx], op)
//        if charArr[idx] == op {
//            var first: Int64 = 0
//            if result.isEmpty {
//                first = findFirstNumber(idx, equation).number
//            } else {
//                print("not empty")
//                print(curEq)
//                first = findFirstNumber(result.count - 1, curEq).number
//                print("first", first)
//            }
//            let second = findSecondNumber(idx, equation).number
//            let calculated = calculate(first, second, charArr[idx])
//
//            if result.isEmpty {
//                let rangeOne = charArr[0..<idx - findFirstNumber(idx, equation).count]
//                print("r1", rangeOne)
//                result.append(contentsOf: rangeOne)
//            }
//
//            let rangeTwo = charArr[idx + findSecondNumber(idx, equation).count + 1..<charArr.count]
//            result.append(contentsOf: calculated)
//            result.append(contentsOf: rangeTwo)
//            print("r2", rangeTwo)
//
//            let str = String(result)
//            print(str)
//            idx += 1
//            let modifiedStr = modifyStr(equation, op, &result, &idx)
//        } else {
//            idx += 1
//        }
//
//    }
//
//    return result
//}
//
//var arr = [Character]()
//var visited = [Bool](repeating: false, count: 3)
//func prioritize(_ equation: inout String) {
//    if arr.count == 3 {
//        var result: [Character] = []
//        var idx = 0
//        let result1 = modifyStr(equation, arr[0], &result, &idx)
////        print(1, result)
//        idx = 0
//        var next: String
//        if result1.isEmpty { next = equation }
//        else { next = String(result1) }
//        result = []
//        let result2 =  modifyStr(next, arr[1], &result, &idx)
////        print(2, result2)
//        idx = 0
//        if result2.isEmpty { next = equation }
//        else { next = String(result2) }
//        result = []
//        let result3 = modifyStr(next, arr[2], &result, &idx)
////        print(3, result)
//
//        let num = Int64(String(result3))!
//        answer = max(answer, num)
//        return
//    }
//
//    for i in 0..<3 {
//        if visited[i] { continue }
//        visited[i] = true
//        arr.append(operators[i])
//        prioritize(&equation)
//        arr.removeLast()
//        visited[i] = false
//    }
//}
//
//func solution(_ expression:String) -> Int64 {
//    // charArr을 돌면서 1순위 연산자를 찾는다
//    // 1순위 연산자 앞뒤로 가면서 숫자를 두 개 찾는다
//    // 1순위 연산 시행
//    // 그 다음 1순위 연산자를 찾아서 같은거 시행 -> 1순위 연산자 두개가 연속해서 나오면 어떡할거임?
//    // 연산을 시행한 후에 스트링을 수정한다? (inout으로 받아서)
//
//    // operator의 순열을 만들고, 그 순열을 매개변수로 calculate에 넘김
//    var expression = expression
//    prioritize(&expression)
//
//    print(answer)
//    return answer
//}
//
//var sol = solution("50*6-3*2")

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
