import UIKit

class Solution {
    func reverseWords(_ s: String) -> String {
        let ss = s.map({String($0)})
        var words = [String]()
        var word = [String]()
        var i = 0
        while i < ss.count {
            if ss[i] == " " {
                if word.count > 0 {
                    words.append(word.reduce("", +))
                    word.removeAll()
                }
            }
            else {
                word.append(ss[i])
            }
            i = i + 1
        }
        if word.count > 0 {
            words.append(word.reduce("", +))
            word.removeAll()
        }
        words.reverse()
        return words.joined(separator:" ")
    }
}
