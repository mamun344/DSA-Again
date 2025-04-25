//
//  main.swift
//  String-Max Subarray
//
//  Created by Admin on 25/4/25.
//

import Foundation


//https://leetcode.com/problems/longest-substring-without-repeating-characters
//https://www.geeksforgeeks.org/length-of-the-longest-substring-without-repeating-characters/

func maxSubArrayLength(_ str: String) -> Int {
   
    var left = 0, right = 0
    let chars = Array(str)
    
    var map : [Character: Int] = [:] // hold char wise index
    var length = 0
    
    while right < chars.count {
        
        // is this char visited
        if let prevIndex = map[chars[right]] {
            
            // clear the visited history from left to this char
            for i in left...prevIndex {
                map[chars[i]] = nil
            }
            
            // next subarray will start after this char
            left = prevIndex + 1
        }
        else {
            // calc the current subarry length. Also the max length
            length = max(length, right-left+1)
        }
        
        // always store the visited history
        map[chars[right]] = right

        right += 1
    }
    
    return length
}

print(maxSubArrayLength("abcbadbd"))
print(maxSubArrayLength("geeksforgeeks"))






func longestUniqueSubstr(_ s: inout String) -> Int {
    if s.isEmpty || s.count == 1 {
        return s.count
    }

    var res = 0
    var vis = Array(repeating: false, count: 26)

    // left and right pointer of sliding window
    var left = 0
    var right = 0
    let characters = Array(s)

    while right < characters.count {
        // If character is repeated, move left pointer marking
        // visited characters as false until the repeating
        // character is no longer part of the current window
        
        let rightIndex = Int(characters[right].asciiValue! - Character("a").asciiValue!)
        print("rightIndex", rightIndex)
        
        while vis[rightIndex] {
            let leftIndex = Int(characters[left].asciiValue! - Character("a").asciiValue!)
            vis[leftIndex] = false
            print("leftIndex", leftIndex)
            left += 1
        }

        vis[Int(characters[right].asciiValue! - Character("a").asciiValue!)] = true

        // The length of the current window (right - left + 1)
        // is calculated and answer is updated accordingly.
        res = max(res, right - left + 1)
        right += 1
    }
    return res
}

var s = "abcbadbd"
//print(longestUniqueSubstr(&s))
