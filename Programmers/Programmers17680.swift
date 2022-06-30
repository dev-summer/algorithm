// Programmers 17680 캐시

import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var time = 0
    
    if cacheSize == 0 {
        time = 5 * cities.count
        return time
    }
    
    var cities = cities
    for i in 0..<cities.count {
        cities[i] = cities[i].lowercased()
    }
    
    var cache: Array<String> = []

    for i in 0..<cities.count {
        if cache.count < cacheSize {
            if cache.contains(cities[i]) {
                var idx = cache.firstIndex(of: cities[i])!
                cache.remove(at: idx)
                cache.append(cities[i])
                time += 1
            } else {
                cache.append(cities[i])
                time += 5
            }
        } else {
            if cache.contains(cities[i]) {
                var idx = cache.firstIndex(of: cities[i])!
                cache.remove(at: idx)
                cache.append(cities[i])
                time += 1
            } else {
                cache.removeFirst()
                cache.append(cities[i])
                time += 5
            }
        }
    }
    
    return time
}

print(solution(5, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]))
print(solution(2, ["Jeju", "Pangyo", "NewYork", "newyork"]))
