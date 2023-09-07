import Swift

let dictionary: [Int: Int] = [1:0,
                              2:100,
                              3:500,
                              4:1000,
                              5:4000,
                              6:10000]

let arrayOfKeys = dictionary.keys.sorted(by: < )


func findLevel(_ value: Int) -> Int? {
    for arrayKey in arrayOfKeys {
        
        let arrayValue = dictionary[arrayKey] ?? 0
        
        print("\(arrayValue) >= \(value)")
        
        if arrayValue > value {
            return arrayKey - 1
        }
    }
    
    return nil
}

struct Level {
    let levelNumber: Int
    let pointsRange: ClosedRange<Int>
}

let levels = dictionary.map { key, value -> Level in
    let start = value
    let end = dictionary[key + 1, default: Int.max]
    return Level(levelNumber: key, pointsRange: start...(end-1))
}

for level in levels {
    print(level)
}

//func findLevel(_ value: Int) -> Int {
//    for level in levels {
//        if level.pointsRange.contains(value) {
//            return level.levelNumber
//        }
//    }
//    return 0
//
//}
//
print("For 0 exp: \(findLevel(0)) should be 1")
print("For 50 exp: \(findLevel(50)) should be 1")
print("For 120 exp: \(findLevel(120)) should be 2")
print("For 600 exp: \(findLevel(600)) should be 3")
print("For 1000 exp: \(findLevel(1000)) should be 4")
print("For 21000 exp: \(findLevel(21000)) should be 6")
