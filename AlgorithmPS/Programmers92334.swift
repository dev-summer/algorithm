// 프로그래머스 2022 KAKAO 신고 결과 받기

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var reportSet: Set<String> = Set<String>()
    for str in report {
        reportSet.insert(str)
    }
    
    var idIndex = [String: Int]()
    for i in 0..<id_list.count {
        idIndex[id_list[i]] = i
    }
    
    var mails = Array(repeating: 0, count: id_list.count)
    var dict = [String: [String]]()
    
    for str in reportSet {
        let splitName = str.components(separatedBy: " ")
        let reportedID = splitName[1]
        let reporterID = splitName[0]
        if(dict[reportedID] == nil) {
            dict.updateValue([reporterID], forKey: reportedID)
        } else {
            dict[reportedID]?.append(reporterID)
        }
    }
 
    for id in dict.keys {
        if(dict[id]!.count >= k) {
            for i in dict[id]! {
                mails[idIndex[i]!] += 1
            }
        }
    }

    return mails
}

solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo", "apeach frodo", "frodo neo", "muzi neo", "apeach muzi"], 2)
