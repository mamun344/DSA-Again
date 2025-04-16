//
//  main.swift
//  Array Duplicate
//
//  Created by Admin on 16/4/25.
//

import Foundation

//https://leetcode.com/problems/contains-duplicate

func containsDuplicate(_ nums: [Int]) -> Bool {
    
    var set = Set<Int>()
    
    for n in nums {
        if set.contains(n) {
            return true
        }
        else {
            set.insert(n)
        }
    }
    
    return false
}

//print(containsDuplicate([1, 2, 3, 1]))
print(containsDuplicate([1,1,1,3,3,4,3,2,4,2]))
