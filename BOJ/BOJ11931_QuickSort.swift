// BOJ 11931 수 정렬하기 4 (내림차순)
// QuickSort
// pivot값 기준으로 비교

import Foundation

func quickSort(_ arr: inout [Int], _ start: Int, _ end: Int) {
    if start >= end { return }
    
    var key = start
    var left = start + 1
    var right = end
    
    while left <= right {
        while left <= end && arr[left] >= arr[key] { left += 1 }
        while right > start && arr[right] < arr[key] { right -= 1 }
        
        if left > right {
            arr.swapAt(key, right)
        } else {
            arr.swapAt(left, right)
        }
    }
    
    quickSort(&arr, start, right - 1)
    quickSort(&arr, right + 1, end)
}
