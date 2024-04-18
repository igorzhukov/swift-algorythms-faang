//
//  ViewController.swift
//  Merge Intervals
//
//  Created by Igor Zhukov on 4/18/24.
//

import UIKit

/*
Approach
- make sorted input array
- create temp merged array
- for each element from sorted append to merged if not overlapping with previous element or update merged last element with updated merged element

Time complexity:
O(n*logn)
Space complexity:
O(n)
 */

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        
        let sorted = intervals.sorted { $0[0] < $1[0] }
        guard let first = sorted.first else { return [[]] }

        var merged = [first]
        
        for current in sorted {
            guard let last = merged.last else { break }

            let currentStart = current[0]
            let currentEnd = current[1]
            
            let lastStart = last[0]
            let lastEnd = last[1]
            
            if lastEnd >= currentStart {
                merged[merged.count - 1] = [lastStart, max(currentEnd, lastEnd)]
            } else {
                merged.append(current)
            }
        }
        return merged
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let solution = Solution()

        print(solution.merge([[8,16], [1,3], [2,6],[15,18]]))
        print(solution.merge([[2,6], [1,3]]))
        print(solution.merge([[1,4],[2,3]]))
    }
}
