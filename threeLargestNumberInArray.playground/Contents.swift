import UIKit

let testArray = [0, 26, 47, 99, 1, 159, 222, 0, 6, 26]

// MARK: Manual approach
func threeLargesNumbers(array: [Int]) -> [Int] {
    if array.isEmpty {
        return array
    }
    
    var result = Array(repeating: Int.min, count: 3)
    
    for number in array {
        rearrange(number: number, result: &result)
    }
    
    return result
}

func rearrange(number: Int, result: inout [Int]) {
    
    // Determine largest number valid criteria
    
    var toInsertIndex = -1
    
    if number > result[2] {
        toInsertIndex = 2
    } else if number > result[1] {
        toInsertIndex = 1
    } else if number > result[0] {
        toInsertIndex = 0
    } else {
        return
    }
    
    // Shifting result backwards
    
    var currentIndex = toInsertIndex
    
    while currentIndex > 0 {
        let temp = result[currentIndex - 1]
        result[currentIndex - 1] = result[toInsertIndex]
        currentIndex -= 1
        result[toInsertIndex] = temp
    }
    
    result[toInsertIndex] = number
}

threeLargesNumbers(array: testArray)


// MARK: Swift sorted approach

let upper = min(3, testArray.count)
Array(testArray
    .sorted()
    .reversed()[0..<upper]
    .reversed()
)
