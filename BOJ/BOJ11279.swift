// BOJ 11279 최대 힙
import Foundation

struct Heap<T: Comparable> {
    var arr = Array<T>()
    
    func isEmpty() -> Bool {
        if arr.count <= 1 { return true } else { return false }
    }
    
    mutating func push(data: T) {
        if arr.count == 0 {
            arr.append(data)
            arr.append(data)
        } else {
            arr.append(data)
        }
        
        shiftUp(child: arr.count - 1)
    }
    
    mutating func shiftUp(child: Int) {
        var child = child
        
        func heapify(child: Int) -> Bool {
            let parent = child / 2
            if child <= 1 { return false }
            
            return arr[child] > arr[parent] ? true : false
        }
        
        while heapify(child: child) {
            let parent = child / 2
            
            arr.swapAt(child, parent)
            child = parent
        }
    }
    
    mutating func pop() -> T? {
        if arr.count <= 1 { return nil }
        arr.swapAt(1, arr.count - 1)
        
        defer { shiftDown(parent: 1)}
        
        return arr.removeLast()
    }
    
    mutating func shiftDown(parent: Int) {
        var parent = parent
        
        while true {
            let left = parent * 2
            let right = parent * 2 + 1
            var target = parent

            if left < arr.count && arr[left] > arr[target] {
                target = left
            }

            if right < arr.count && arr[right] > arr[target] {
                target = right
            }

            if target == parent { return }

            arr.swapAt(target, parent)
            parent = target
        }
    }
}

let total = Int(readLine()!)!
var heap = Heap<Int>()

for _ in 1...total {
    let input = Int(readLine()!)!
    if input == 0 {
        if heap.isEmpty() {
            print(0)
        } else {
            print(heap.pop()!)
        }
    } else {
        heap.push(data: input)
    }
}
