let numbers = Int(readLine()!)!
let numArr = readLine()!.split(separator: " ").map { Int($0)! }
var symbols = readLine()!.split(separator: " ").map { Int($0)! }

func recur(_ sum: Int, _ idx: Int) {
    var sum = sum
    for i in 0..<4 {
        if symbols[i] > 0 {
            symbols[i] -= 1
            if i == 0 {
                sum += numArr[idx]
                recur(sum, idx + 1)
            } else if i == 1 {
                sum -= numArr[idx]
                recur(sum, idx + 1)
            } else if i == 2 {
                sum *= numArr[idx]
                recur(sum, idx + 1)
            } else if i == 3 {
                if sum < 0 {
                    var temp = -sum
                    temp /= numArr[idx]
                    sum = -temp
                    recur(sum, idx + 1)
                }
            }
        }
    }
}

recur(numArr[0], 1)
