// BOJ 11931 수 정렬하기 4 (내림차순)
// MergeSort
// 배열을 반씩 쪼개나간 후 합병 과정에서 정렬

import Foundation

func merge(_ arr: inout [Int], _ start: Int, _ mid: Int, _ end: Int) {
    var left = start
    var right = mid + 1
    var index = start
    
    while left <= mid && right <= end {
        if arr[left] >= arr[right] {
            sortedArr[index] = arr[left]
            left += 1
        } else {
            sortedArr[index] = arr[right]
            right += 1
        }
        index += 1
    }
    
    // 오른쪽이 남음
    if left > mid {
        for i in right...end {
            sortedArr[index] = arr[i]
            index += 1
        }
    } else {
        for i in left...mid {
            sortedArr[index] = arr[i]
            index += 1
        }
    }
    
    for i in start...end {
        arr[i] = sortedArr[i]
    }
}

func mergeSort(_ arr: inout [Int], _ start: Int, _ end: Int) {
    if start < end {
        let mid = (start + end) / 2
        mergeSort(&arr, start, mid)
        mergeSort(&arr, mid + 1, end)
        merge(&arr, start, mid, end)
    }
}

fileprivate var sortedArr = [Int]()
