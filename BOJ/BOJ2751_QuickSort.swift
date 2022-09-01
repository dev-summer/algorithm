// BOJ 2751 수 정렬하기 2 (오름차순)
// QuickSort
// key(pivot)값을 기준으로 key값의 위치를 찾은 후
// 부분배열로 나눠서 정렬
// 시간초과

import Foundation

func quickSort(_ arr: inout [Int], _ start: Int, _ end: Int) {
    if start >= end { return }
    var key = start
    var left = start + 1
    var right = end
    
    while left <= right {
        while left <= end && arr[left] < arr[key] { left += 1 }
        while right > start && arr[right] > arr[key] { right -= 1 }
    
        if left > right {
            arr.swapAt(key, right)
        } else {
            arr.swapAt(left, right)
        }
    }
    
    quickSort(&arr, start, right - 1)
    quickSort(&arr, right + 1, end)
}

let size = Int(readLine()!)!
var arr = [Int]()

for _ in 1...size {
    let input = Int(readLine()!)!
    arr.append(input)
}

quickSort(&arr, 0, size - 1)
arr.forEach { print($0) }
