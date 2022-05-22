// 프로그래머스 92334 2022 KAKAO 신고 결과 받기

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    // 중복된 신고를 거르기 위해 report를 set에 담는다
    var reportSet: Set<String> = Set<String>()
    for str in report {
        reportSet.insert(str)
    }
    
    // [ID: mails의 index]
    // id_list에서 읽어들인 순서대로 index를 value로 지정
    // 왜?? return하는 받은 mail 개수 배열에 id_list 순서대로 넣어주기 위해 아이디 - index 매핑
    var idIndex = [String: Int]()
    for i in 0..<id_list.count {
        idIndex[id_list[i]] = i
    }
    
    // ID별 받은 메일의 개수를 저장하는 배열
    var mails = Array(repeating: 0, count: id_list.count)
    // [신고받은사람: [신고한사람]]
    var dict = [String: [String]]()


    // reportSet의 각 원소를 신고자id와 신고된id로 나누어
    // 신고된id = dict의 key, 신고자id = dict의 value array의 원소
    for str in reportSet {
        let splitName = str.components(separatedBy: " ")
        let reportedID = splitName[1]
        let reporterID = splitName[0]
       // if(dict[reportedID] == nil) {
   //         dict.updateValue([reporterID], forKey: reportedID)
     //   } else {
            dict[reportedID, default: []].append(reporterID)
        // nil이 나올 경우 빈 배열[]를 넣어주기 때문에
        // 바로 append 가능
        
     //   }
    }
 
    // dict의 key를 id로 돌면서 dict[id]의 value인 array이 원소(신고자이름)의 개수가 k 이상일 경우
    // dict[id]의 value인 array의 원소(신고자이름)를 i로 돌면서
    // 신고자이름 = idIndex[i] 인 id index를 받아와서
    // mail array의 해당 index에 +1
    for id in dict.keys {
        if(dict[id, default: []].count >= k) {
            for i in dict[id]! {
                mails[idIndex[i]!] += 1
            }
        }
    }

    return mails
}
