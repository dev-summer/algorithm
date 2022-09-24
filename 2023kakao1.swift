// 오답. 1, 14, 17 케이스 틀림
import Foundation

var dict = [String: Int]()
var answer = [Int]()

func dateSeparator(_ date: String) -> (year: Int, month: Int, day: Int) {
    let dateArr = date.split(separator: ".").map { Int(String($0))! }

    return (dateArr[0], dateArr[1], dateArr[2])
}

func addDate(_ term: String, _ startDate: (year:Int, month: Int, day: Int)) -> (year: Int, month: Int, day: Int) {
    var endDate = (year: startDate.year, month: startDate.month, day: startDate.day)
    // 1월 1일의 경우

    if endDate.day == 1 {
        endDate.day = 28
        endDate.month -= 1
    } else {
        endDate.day -= 1
    }

    if endDate.month == -1 {
        endDate.year -= 1
    }
    
    endDate.month += dict[term, default: 0]

    let addyear = endDate.month / 12
    endDate.month = endDate.month % 12
    if endDate.month == 0 {
        endDate.month = 12
    }
    endDate.year += addyear
    
    return endDate
}

func dateToInt(_ date: (year: Int, month: Int, day: Int)) -> Int {
    var result: String = ""

    result += String(date.year)
    
    if date.month > 9 {
        result += String(date.month)
    } else {
        result += "0"
        result += String(date.month)
    }


    if date.day > 9 {
        result += String(date.day)
    } else {
        result += "0"
        result += String(date.day)
    }

    return Int(result)!
}

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    for term in terms {
        let div = term.split(separator: " ").map { String($0) }
        dict[div[0], default: 0] = Int(div[1])!
    }

    let todayTuple = dateSeparator(today)
    let todayInt = dateToInt(todayTuple)

    for i in 0..<privacies.count {
        let div = privacies[i].split(separator: " ").map { String($0) }
        let term = div[1]
        let startDate = div[0]

        
        let startDateTuple = dateSeparator(startDate)
        let endDateTuple = addDate(term, startDateTuple)
        let endDateInt = dateToInt(endDateTuple)

        print(endDateInt)
        if todayInt > endDateInt {
            answer.append(i + 1)
        }
    }

    return answer
}

//solution(
//    "2020.01.01", ["Z 3", "D 5"], ["2019.01.01 D", "2019.11.15 Z", "2019.08.02 D", "2019.07.01 D", "2018.12.28 Z"])
