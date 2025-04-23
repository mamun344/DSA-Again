//
//  main.swift
//  Array MaxProduct Subarray
//
//  Created by Admin on 16/4/25.
//

import Foundation

//https://leetcode.com/problems/maximum-product-subarray

//https://takeuforward.org/data-structure/maximum-product-subarray-in-an-array/

// solved with prefix and suffix approach from above. Not clear how is this works.

func maxProduct(_ nums: [Int]) -> Int {
    
    var prefix = 1, suffix = 1, result = Int.min

    for i in 0..<nums.count {
        if prefix == 0 {
            prefix = 1
        }
        
        if suffix == 0 {
            suffix = 1
        }
        
        prefix *= nums[i]
        suffix *= nums[nums.count - i - 1]
        result = max(result, max(prefix, suffix))
    }
    
    return result
}


print(maxProduct([2, 3, 0, 0, -2, 4]))
//print(maxProduct([-2,3,-4]))



