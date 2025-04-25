//
//  main.swift
//  String-Palindrom
//
//  Created by Admin on 25/4/25.
//

import Foundation

//https://leetcode.com/problems/valid-palindrome

//A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.
                            
func isPalindrome(_ s: String) -> Bool {
    
    let t = s.compactMap { c in
        if let v = c.asciiValue {
            let vv = Int(v)

            if  (vv >= 97 && vv <= 122) || (vv >= 65 && vv <= 90) || (vv >= 48 && vv <= 57) {
                return c.lowercased()
            }
            else {
                return nil
            }
        }
        else {
            return nil
        }
    }
    
    for i in 0..<t.count/2 {
        if t[i] != t[t.count - i - 1] {
            return false
        }
    }
    
    return true
}

//print(isPalindrome("A man, a plan, a canal: Panama"))

//print(isPalindrome("0P"))
print(isPalindrome("Zeus was deified, saw Suez."))


