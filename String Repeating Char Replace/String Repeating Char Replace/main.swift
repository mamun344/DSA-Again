//
//  main.swift
//  String Repeating Char Replace
//
//  Created by Admin on 1/5/25.
//

import Foundation

//https://leetcode.com/problems/longest-repeating-character-replacement/description/

//https://www.geeksforgeeks.org/maximum-length-substring-having-all-same-characters-after-k-changes/


func characterReplacement2(_ s: String, _ k: Int) -> Int {
       var count = [Character: Int]()
       var res = 0
       var l = 0, maxf = 0
       let chars = Array(s)

       for r in 0..<chars.count {
           count[chars[r], default: 0] += 1
           maxf = max(maxf, count[chars[r]]!)

           while (r - l + 1) - maxf > k {
               count[chars[l], default: 0] -= 1
               l += 1
           }
           res = max(res, r - l + 1)
       }
       
       return res
   }

func characterReplacement(_ s: String, _ k: Int) -> Int {

    let chars = Array(s)
    var map : [Character: Int] = [:] // chars frequency
    
    var left = 0, maxLength = 0, windowSize = 0, maxFreq = 0, right = 0

    
    for char in chars {
        
        // always store the visit history
        map[char, default: 0] += 1
        
        // get the length occupied by the current char
        // max frequency got so far
        maxFreq = max(maxFreq, map[char] ?? 0)

        // current window size
        windowSize = right - left + 1

        // number of chars we can change exceeds the given k
        if windowSize - maxFreq > k {
            // removing left's char visit history
            map[chars[left]] = max(map[chars[left], default: 0] - 1, 0)
            
            // moving left pointer to right by 1
            left += 1
        }
        
        maxLength = max(maxLength, right - left + 1)
        
        right += 1
    }
    
    return maxLength
}


print(characterReplacement("BAAAB", 2))

//print(characterReplacement2("ABABBA", 2))

print(characterReplacement("BCDEAFGAAIJK", 2))
//print(characterReplacement("AFGAAIJ", 2))


//print(characterReplacement("EOEMQLLQTRQDDCOERARHGAAARRBKCCMFTDAQOLOKARBIJBISTGNKBQGKKTALSQNFSABASNOPBMMGDIOETPTDICRBOMBAAHINTFLH", 7))

//print(characterReplacement2("KRSCDCSONAJNHLBMDQGIFCPEKPOHQIHLTDIQGEKLRLCQNBOHNDQGHJPNDQPERNFSSSRDEQLFPCCCARFMDLHADJADAGNNSBNCJQOF", 4))



//print(characterReplacement("ABAA", 0))



//print(characterReplacement("ABAB", 0))
//print(characterReplacement("AABABBA", 1))


