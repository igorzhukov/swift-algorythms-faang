import UIKit

class Solution {
    
    private var sol = [String]()
    
    func permutations(s: String) -> [String] {
        let ss = s.map( { String($0) } )
        getPerms(ss, 0)
        return sol
    }
    
    private func getPerms(_ s: [String], _ index: Int) {
        print(s)
        print(index)
        print(index == s.count)
        if index == s.count {
            sol.append(s.reduce("", +))
            print(sol)
            return
        }
        var i = index
        while i < s.count {
            var st = s
            
            st.swapAt(index, i)
            getPerms(st, index + 1)
            print(st)
            st.swapAt(index, i)
            print(st)
            i = i + 1
        }
    }
    
}


let solution = Solution()
let permutations = solution.permutations(s: "abc")
//print(permutations)


