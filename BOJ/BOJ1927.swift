// BOJ 1927 최소 힙

import Foundation

struct minHeap<T: Comparable> {
    var heap: Array<T> = []
    
    mutating func push(_ data: T) {
        // 1번 인덱스부터 사용하기 위해 0번 인덱스에는 임시로 1번 인덱스의 값을 채워줌
        if heap.count == 0 {
            heap.append(data)
            heap.append(data)
        } else { heap.append(data) }
        shiftUp(child: heap.count - 1)
    }
    
    // child를 정렬하는 함수
    mutating func shiftUp(child: Int) {
        var child = child
        
        func heapify(_ child: Int) -> Bool {
            let parent = child / 2
            
            // child 노드의 위치가 root와 같거나 작은 경우
            // 자리를 바꿀 대상이 없으므로 false
            if child <= 1 {
                return false
            }
            // child 노드의 값이 parent 노드의 값보다 작은 경우 true
            return heap[child] < heap[parent] ? true : false
        }
        
        // child 노드의 값이 parent 노드의 값보다 작을 경우
        while heapify(child) {
            let parent = child / 2
            
            // child 노드와 parent 노드의 값을 서로 바꾼다
            heap.swapAt(child, parent)
            
            // 정렬하고자 하는 child 노드의 값이 parent 노드로 옮겨갔기 때문에
            // child 노드의 위치를 조정
            child = parent
        }
    }
    
    mutating func pop() -> T? {
        // heap에 루트 노드가 없으므로 nil을 반환하고 끝
        if heap.count <= 1 { return nil }
        
        // 루트 노드와 맨 마지막 노드를 교환
        heap.swapAt(1, heap.count - 1)
        
        // defer를 사용하여 return의 removeLast()가 실행된 후 실행된다
        // 루트 노드의 자리로 온 맨 마지막 노드의 위치를 찾는다
        defer { shiftDown(parent: 1) }
        
        // 맨 마지막 노드를 반환&삭제
        return heap.removeLast()
    }

    
    // 루트 노드의 자리로 올라간 맨 마지막 노드 = parent 의 위치 찾기
    mutating func shiftDown(parent: Int) {
        var parent = parent
        
        while true {
            // parent를 var로 다시 선언했기 때문에
            // while안에서 변경된 parent의 값에 따라 left, right가 변경됨
            let left = parent * 2
            let right = parent * 2 + 1
            
            // parent와 위치를 바꿀 노드의 index = target
            var target = parent
            
            // left child가 존재하고, parent 보다 작을 경우
            // candidate의 위치를 left로 변경
            if left < heap.count && heap[left] < heap[target] {
                target = left
            }
            
            // right child가 존재하고, parent 보다 작을 경우
            // 현재 target은 left 또는 target(parent) 중 작은 값
            if right < heap.count && heap[right] < heap[target] {
                target = right
            }
            
            // 더 이상 자식 노드가 없을 때
            // 또는 target(parent) 보다 작은 자식 노드가 없을 때
            if target == parent { return }
            
            // target과 parent의 값을 교환하고
            heap.swapAt(parent, target)
            
            // parent가 target위치로 이동했으므로,
            // parent 노드의 인덱스를 target으로 조정
            parent = target
        }
    }
}

var total = Int(readLine()!)!
var heap = minHeap<Int>()

for _ in 1...total {
    let input = Int(readLine()!)!
    if input == 0 {
        if heap.heap.count > 1 {
            print(heap.pop()!)
        } else {
            print(0)
        }
    } else {
        heap.push(input)
    }
}
