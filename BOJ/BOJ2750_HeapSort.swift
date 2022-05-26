// BOJ 2750 수 정렬하기
// HeapSort

struct Heap {
    var arr = [Int]()
    
    mutating func push(_ data: Int) {
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
        
        func heapify(_ child: Int) -> Bool {
            let parent = child / 2
            if child <= 1 { return false }
            return arr[child] < arr[parent] ? true : false
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

        defer { shiftDown(parent: 1) }
        
        return arr.removeLast()
    }
    
    mutating func shiftDown(parent: Int) {
        var parent = parent
        
        while true {
            var target = parent
            let left = target * 2
            let right = target * 2 + 1
            
            if left < arr.count && arr[left] < arr[target] { target = left }
            if right < arr.count && arr[right] < arr[target] { target = right }
            
            if target == parent { return }
            arr.swapAt(parent, target)
            parent = target
        }
    }
}

fileprivate let size = Int(readLine()!)!
fileprivate var minHeap = Heap()

for _ in 1...size {
    let input = Int(readLine()!)!
    minHeap.push(input)
}
print(minHeap.arr)

for _ in 1...size {
    print(minHeap.pop()!)
}
