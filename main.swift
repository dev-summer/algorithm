// 프로그래머스 42586 기능개발

import Foundation

func solution(_ progresses: [Int], _ speeds: [Int]) -> [Int] {
    
    // 0번째 인덱스의 값이 100이 되었을 때 1번째, 2번째, ... 순으로 확인
    // parameter가 let으로 들어오기 때문에, 들어오는 배열을 가공하기 위한 복사본 생성
    var workingArr = progresses
    var speedsCopy = speeds
    var releaseArr = [Int]()
    var release = 0


    // 0 1 2 ... n-1 에 모두 작업율+
    // workingArr의 0번째 인덱스의 값 >= 100이 될 때까지 작업율을 더해주는 싸이클을 반복한 후,
    // workingArr의 0번째 인덱스의 값 >= 100 이면
    // workingArr의 0번째 인덱스의 값과 speedsCopy의 0번째 인덱스의 값을 빼주는 연산을 반복
    repeat {
        for i in 0..<workingArr.count {
            workingArr[i] += speedsCopy[i]
        }
        
        // repeat-while의 경우 repeat의 연산을 먼저 수행한 후 while의 조건을 확인하기 때문에
        // workingArr의 마지막 원소를 제거할 때
        // repeat의 연산을 수행한 후 workingArr = nil이 되어
        // while의 조건을 확인할 수 없게 된다
        // 따라서 workingArr = nil 이면 break 하도록 해야 함
//        repeat {
//            if(workingArr[0] >= 100) {
//                workingArr.removeFirst()
//                speedsCopy.removeFirst()
//                release += 1
//                if workingArr.isEmpty { break }
//            }
//        } while workingArr[0] >= 100
        
        // while로 반복하는 경우에도
        // workingArr의 모든 원소가 제거된 이후 workingArr = nil이 되어
        // while의 조건을 확인할 수 없게 된다
        // 따라서 workingArr = nil 이면 break 하도록 해야 함
        while workingArr[0] >= 100 {
            if(workingArr[0] >= 100) {
                workingArr.removeFirst()
                speedsCopy.removeFirst()
                release += 1
            }
            if workingArr.isEmpty { break }
        }

        if(release > 0 ) {
            releaseArr.append(release)
        }
        release = 0
    } while !workingArr.isEmpty
       
    print(releaseArr)
    return releaseArr
}

solution([93,30,55],[1,30,5])
