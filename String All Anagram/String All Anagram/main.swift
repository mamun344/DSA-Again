//
//  main.swift
//  String All Anagram
//
//  Created by Admin on 3/5/25.
//

import Foundation

func findAnagrams(_ s: String, _ p: String) -> [Int] {

    guard p.count <= s.count else { return [] }
    
    var indices: [Int] = []
    
    
    var left = 0, right = 0
    let chars = Array(s)
    let sLen = s.count, pLen = p.count
    
    
    var pMap: [Character: Int] = [:]
    var aMap: [Character: Int] = [:]

    for c in p {
        pMap[c, default: 0] += 1
    }
    
    
    while right < sLen, sLen - left >= pLen {
        
        aMap[chars[right], default: 0] += 1
        
        if right-left+1 == pLen {
       
            var found = true
            
            for (k, v) in pMap {
                if let av = aMap[k] {
                    if av != v {
                        found = false
                        break
                    }
                }
                else {
                    found = false
                    break
                }
            }
            
            if found {
                indices.append(left)
            }
            
            aMap[chars[left], default: 0] -= 1
            left += 1
        }
        
        right += 1
    }
    
    return indices
}


//print(findAnagrams("cbaebabacd", "abc"))
//print(findAnagrams("abab", "ab"))
print(findAnagrams("ab", "ba"))


