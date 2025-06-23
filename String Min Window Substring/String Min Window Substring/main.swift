//
//  main.swift
//  String Min Window Substring
//
//  Created by Admin on 3/5/25.
//

import Foundation

func minWindow3(_ s: String, _ t: String) -> String {
    if t.isEmpty { return "" }
    
    var mpt = [Character: Int]()
    var mps = [Character: Int]()
    for char in t {
        mpt[char, default: 0] += 1
    }
    
    var cur = 0, total = mpt.count
    var i = 0, j = 0
    var res = Int.max
    var indices = (0, 0)
    
    let sArray = Array(s)
    while j < sArray.count {
        let char = sArray[j]
        if mpt[char] != nil { mps[char, default: 0] += 1 }
        if mpt[char] != nil && mps[char] == mpt[char] { cur += 1 }
        
        while cur == total {
            // update result
            if j - i + 1 < res {
                res = j - i + 1
                indices = (i, j)
            }
            // shrink
            if mps[sArray[i]] != nil {
                mps[sArray[i]]! -= 1
                if mps[sArray[i]]! < mpt[sArray[i]]! { cur -= 1 }
            }
            i += 1
        }
        j += 1
    }
    if res == Int.max { return "" }
    return String(sArray[indices.0...indices.1])
}

func minWindow2(_ s: String, _ t: String) -> String {
    
    guard s.isEmpty == false, t.count <= s.count else { return "" }
    
    var left = 0//, right = 0
    let ss = Array(s)
    let sLen = s.count, tLen = t.count
    
    var tMap : [Character: Int] = [:]
    var wMap : [Character: Int] = [:]

    var windowLength = Int.max, windowStart = -1
    var widowCharsCount = 0
    
    t.forEach {
        tMap[$0, default: 0] += 1
    }
    
    var char: Character!
    
    for right in 0..<sLen where left+tLen <= sLen {
        char = ss[right]
        
        if tMap[char] != nil {
            if widowCharsCount == 0 {
                left = right
            }
            
            wMap[char, default: 0] += 1
            widowCharsCount += 1
        }
    
        
        if widowCharsCount == tLen {
            var found = true
            
            for (t, v) in tMap {
                if wMap[t] == nil {
                    found = false
                    break
                }
                else if wMap[t] != v {
                    found = false
                    break
                }
            }
            
            
            if found, right - left + 1 < windowLength {
                windowStart = left
                windowLength = right - left + 1
            }
            
            wMap[ss[left], default: 0] -= 1
            left += 1
            widowCharsCount -= 1

            while left < right, tMap[ss[left]] == nil {
                left += 1
            }
        }
    }
    
    if windowStart != -1 {
        return String(ss[windowStart..<windowStart+windowLength])
    }
 
    return ""
}


print(minWindow2("aaaaaaaaaaaabbbbbcdd", "abcdd")) //abbbbbcdd


//print(minWindow2("bba", "ab"))
//print(minWindow2("ABC", "C")) //C


//print(minWindow3("DADOBECODEBACNC", "ABC")) // BANC
//print(minWindow2("DAOBECODEBANC", "ABC")) // BANC

//print(minWindow2("a", "aa")) // ""
//print(minWindow2("a", "a")) // ""
//print(minWindow2("ab", "b")) // b
















//class Solution {
    
    func minWindow(_ s: String, _ t: String) -> String {
        guard t.count <= s.count else { return "" }
        
        var res = ""
        var index = -1, minLength = Int.max
        var left = 0, right = 0
        
        let chars = Array(s)
        let sLen = chars.count
        let tLen = t.count
        
        var tMap: [Character: Int] = [:]
        var wMap: [Character: Int] = [:]

        for c in t {
            tMap[c, default: 0] += 1
        }
        
        var windowCharCount = 0
        
        
        while right < sLen, sLen - left >= tLen {
            
            if wMap.isEmpty {
                left = right
            }
            
            
            if let value = tMap[chars[right]], (wMap[chars[right]] ?? 0) < value {
                    
                wMap[chars[right], default: 0] +=  1
//                if windowCharCount == 0 {
//                    left = right
//                }
//                
//                windowCharCount += v
            }
            else {
                right += 1
                continue
            }
            
          
            
            windowCharCount = wMap.reduce(0) { $0 + $1.value }
            
            if windowCharCount == tLen {
                
//                if tMap[chars[left]] != nil {
                    if right-left+1 < minLength {
                        minLength = right-left+1
                        index = left
                    }
//                }
                
                wMap[chars[left], default: 0] -=  1
                left += 1
                
                windowCharCount -= 1
                
                while left < chars.count, tMap[chars[left]] == nil {
                    left += 1
                }
            }
            
            right += 1
        }
        
        if index != -1 {
            res = String(chars[index..<index+minLength])
        }
        
        return res
    }
//}

/*
print(minWindow("bba", "ab"))

print(minWindow("ABC", "C")) //C


print(minWindow("ADOBECODEBANC", "ABC")) // BANC
print(minWindow("DAOBECODEBANC", "ABC")) // BANC

print(minWindow("a", "aa")) // ""
print(minWindow("ab", "b")) // b
*/
