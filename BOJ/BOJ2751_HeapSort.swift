// BOJ 2751 수 정렬하기 2 (오름차순)
// HeapSort
// 완전이진트리

import Foundation

struct Heap {
    var arr = [Int]()
    
    mutating func push(_ data: Int) {
        if arr.count == 0 {
            arr.append(data)
            arr.append(data)
        } else { arr.append(data) }
        
        shiftUp(arr.count - 1)
    }
    
    mutating func shiftUp(_ child: Int) {
        var child = child
        
        func heapify(_ child: Int) -> Bool {
            let parent = child / 2
            if child <= 1 { return false }
            
            if arr[child] < arr[parent]{
                return true
            } else { return false }
        }
        
        while heapify(child) {
            let parent = child / 2
            
            if arr[child] < arr[parent] {
                arr.swapAt(child, parent)
                child = parent
            }
        }
        
    }
    
    mutating func pop() -> Int? {
        if arr.count <= 1 { return nil }
        arr.swapAt(1, arr.count - 1)
        
        defer { shiftDown(arr.count - 1) }
        
        return arr.removeLast()
    }

    mutating func shiftDown(_ parent: Int) {
        var parent = parent

        while true {
            var target = parent
            let left = target * 2
            let right = target * 2 + 1
            
            if left < arr.count && arr[left] < arr[target] { target = left }
            if right < arr.count && arr[right] < arr[target] { target = right }
            
            if target == parent { return }
            arr.swapAt(target, parent)
            parent = target
        }

    }
}

var minHeap = Heap()
