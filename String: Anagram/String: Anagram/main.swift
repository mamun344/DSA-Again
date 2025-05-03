//
//  main.swift
//  String: Anagram
//
//  Created by Admin on 25/4/25.
//

import Foundation


//https://leetcode.com/problems/valid-anagram

func isAnagram(_ s: String, _ t: String) -> Bool {
    
    var map: [Character: Int] = [:]
    
    for c in s {
        map[c, default: 0] += 1
    }
    
    for c in t {
        guard let count = map[c] else {
            return false
        }
        
        if count == 1 {
            map[c] = nil
        } else {
            map[c]! -= 1
        }
    }
    
    return map.isEmpty
}
