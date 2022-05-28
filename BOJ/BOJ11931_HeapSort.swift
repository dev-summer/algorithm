// BOJ 11931 수 정렬하기 4 (내림차순)
// HeapSort
// heapify

import Foundation

struct Heap {
    var arr = [Int]()
    
    mutating func push(_ data: Int) {
        if arr.count == 0 {
            arr.append(data)
            arr.append(data)
        } else {
            arr.append(data)
        }
        
        shiftUp(arr.count - 1)
    }
    
    mutating func shiftUp(_ child: Int) {
        var child = child
        
        func heapify(_ child: Int) -> Bool {
            let parent = child / 2
            if child <= 1 { return false }
            
            return arr[child] > arr[parent] ? true : false
        }
        
        while heapify(child) {
            let parent = child / 2
            
            arr.swapAt(child, parent)
            child = parent
        }
    }
    
    mutating func pop() -> Int? {
        if arr.count <= 1 { return nil }
        arr.swapAt(1, arr.count - 1)
        
        defer { shiftDown(1) }
        
        return arr.removeLast()
    }
    
    mutating func shiftDown(_ parent: Int) {
        var parent = parent
        
        while true {
            let left = parent * 2
            let right = parent * 2 + 1
            var target = parent
            
            if left < arr.count && arr[left] > arr[target] { target = left }
            if right < arr.count && arr[right] > arr[target] { target = right }
            
            if target == parent { return }
            arr.swapAt(target, parent)
            parent = target
        }
    }
}
