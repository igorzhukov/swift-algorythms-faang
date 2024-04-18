//
//  ContentView.swift
//  stringPermutations
//
//  Created by Igor Zhukov on 1/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear() {
           
            let solution = Solution()
            let permutations = solution.permutations(s: "abc")
           

        }
    }
        
}


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
            st.swapAt(index, i)
            print(st)
            i = i + 1
        }
    }
    
}




#Preview {
    ContentView()
}
