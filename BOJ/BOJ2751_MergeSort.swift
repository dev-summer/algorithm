// BOJ 2751 수 정렬하기 2 (오름차순)
// MergeSort
// 가장 작은 부분배열까지 쪼갠 후 합치는 과정에서 정렬

import Foundation

// 쪼개는 함수
func mergeSort(_ arr: [Int]) -> [Int] {
    if arr.count < 2  { return arr }
    let mid = arr.count / 2
    
    let leftArr = Array(arr[0..<mid])
    let rightArr = Array(arr[mid..<arr.count])
    
    return merge(leftArr: mergeSort(leftArr), rightArr: mergeSort(rightArr))
}

// 합치는 함수
func merge(leftArr: [Int], rightArr: [Int]) -> [Int] {
    var sortedArr = [Int]()
    var left = 0
    var right = 0
    // 2
    while left < leftArr.count && right < rightArr.count {
        if leftArr[left] <= rightArr[right] {
            sortedArr.append(leftArr[left])
            left += 1
        } else {
            sortedArr.append(rightArr[right])
            right += 1
        }
    }

    sortedArr.append(contentsOf: leftArr[left..<leftArr.count])
    sortedArr.append(contentsOf: rightArr[right..<rightArr.count])
    
    return sortedArr
}

fileprivate let size = Int(readLine()!)!
fileprivate var arr = Array(repeating: 0, count: size)

for i in 0..<size {
    let input = Int(readLine()!)!
    arr[i] = input
}

fileprivate let sorted = mergeSort(arr)
sorted.forEach { print($0) }
