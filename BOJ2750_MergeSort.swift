// BOJ 2750 수 정렬하기
// MergeSort

import Foundation

func mergeSort<T: Comparable>(_ arr: [T]) -> [T] {
    if arr.count < 2 { return arr }
    
    let mid = arr.count / 2
    let leftArr: [T] = Array(arr[0..<mid])
    let rightArr: [T] = Array(arr[mid..<arr.count])
    
    // 반으로 쪼갠 배열들에 대해 mergeSort로 계속 쪼개서 각 부분배열의 크기가 1이 되면
    // 부분배열 단위로 합병
    return merge(mergeSort(leftArr), mergeSort(rightArr))
}

func merge<T: Comparable>(_ leftArr: [T], _ rightArr: [T]) -> [T] {
    var left = 0
    var right = 0
    var tempArr = [T]()
    
    // 두 배열 중 하나의 정렬이 끝날 때까지
    while left < leftArr.count && right < rightArr.count {
        if leftArr[left] < rightArr[right] {
            tempArr.append(leftArr[left])
            left += 1
        } else if leftArr[left] > rightArr[right] {
            tempArr.append(rightArr[right])
            right += 1
        } else {
            tempArr.append(leftArr[left])
            tempArr.append(rightArr[right])
            left += 1
            right += 1
        }
    }
    // 원소가 남아있는 배열을 갖다 붙임
    tempArr += leftArr[left..<leftArr.count]
    tempArr += rightArr[right..<rightArr.count]
    return tempArr
}

let size = Int(readLine()!)!
var someArr = Array<Int>(repeating:0, count: size)

var sortedArr = mergeSort(someArr)
sortedArr.forEach{ print($0) }
