// BOJ 2750 수 정렬하기
// QuickSort

import Foundation

func quickSort(arr: inout [Int], start: Int, end: Int) {
    if start >= end { return }

    var key = start
    var left = start + 1
    var right = end
        
    while left <= right {
        while left <= end && arr[left] < arr[key] { left += 1 }
        while right > start && arr[right] > arr[key] { right -= 1 }
        
        // left <= right 조건을 체크한 이후 반복문 내로 들어온 이후
        // left, right에 ++되어 left와 right가 교차할 경우 right와 key를 교체
        // 아직 교차하지 않을 경우
        // left의 값이 key보다 크고 right의 값이 key보다 작은 경우기 때문에 둘의 값을 교체
        if left > right {
            arr.swapAt(right, key)
            
        } else {
            arr.swapAt(left, right)
        }
    }
    // 위 과정을 반복하면 key에 있던 값은 자기의 자리를 찾아 간 것이므로
    // key 앞과 뒤의 배열에 대해 정렬
    quickSort(arr: &arr, start: start, end: right - 1)
    quickSort(arr: &arr, start: right + 1, end: end)
}


fileprivate let size = Int(readLine()!)!
fileprivate var someArr = Array<Int>(repeating:0, count: size)

for i in 0..<size {
    let input = Int(readLine()!)!
    someArr[i] = input
}

quickSort(arr: &someArr, start: 0, end: size - 1)
someArr.forEach{ print($0) }
