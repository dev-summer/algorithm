// Programmers 92341 주차 요금 계산

import Foundation

func solution(_ fees: [Int], _ records: [String]) -> [Int] {
    let base = fees[0]
    let baseFee = fees[1]
    let additional = fees[2]
    let additionalFee = fees[3]
    
    var inRecords = [(at: Int, car: Int)]()
    var outRecords = [(at: Int, car: Int)]()

    for i in records {
        let line = i.split(separator: " ").map { String($0) }
        let time = line[0].split(separator: ":").map { Int($0)! }
        
        if line[2] == "IN" {
            inRecords.append((at: time[0] * 60 + time[1], car: Int(line[1])!))
        } else if line[2] == "OUT" {
            outRecords.append((at: time[0] * 60 + time[1], car: Int(line[1])!))
        }
    }
    
    inRecords.sort { $0.car < $1.car }
    outRecords.sort { $0.car < $1.car }

    // index: 차량번호, 값: 주차 시간
    var result = Array(repeating: 0, count: 10000)
    
    var outIndex = 0
    for i in 0..<inRecords.count {
        if outIndex < outRecords.count {
            if inRecords[i].car == outRecords[outIndex].car {
                let time = outRecords[outIndex].at - inRecords[i].at
                result[inRecords[i].car] += time
                outIndex += 1
            } else {
                let time = (23 * 60 + 59) - inRecords[i].at
                result[inRecords[i].car] += time
            }
        } else if outIndex >= outRecords.count {
            let time = (23 * 60 + 59) - inRecords[i].at
            result[inRecords[i].car] += time
        }
    }
    
    let validCars = result.filter { $0 != 0 }
    var totalFee = [Int]()
    print(validCars)
    
    for i in validCars {
        if i - base <= 0 {
            let fee = baseFee
            totalFee.append(fee)
        } else {
            let addTime = i - base
            var fee = baseFee
            if addTime % additional == 0 {
                fee += (addTime / additional) * additionalFee
                totalFee.append(fee)
            } else {
                fee += (addTime / additional) * additionalFee + additionalFee
                totalFee.append(fee)
            }
        }
    }
    
    return totalFee
}

print(solution([120, 0, 60, 591], ["16:00 3961 IN","16:00 0202 IN","18:00 3961 OUT","18:00 0202 OUT","23:58 3961 IN"]))


