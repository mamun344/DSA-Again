//
//  main.swift
//  Array Product
//
//  Created by Admin on 16/4/25.
//

import Foundation

//https://leetcode.com/problems/product-of-array-except-self

func productExceptSelf(_ nums: [Int]) -> [Int] {
    
    var ans = [Int].init(repeating: 1, count: nums.count)
    var left = 1, right = 1
    
    for i in stride(from: 0, to: nums.count, by: 1) {
        ans[i] *= left
        ans[nums.count - 1 - i] *= right

        left *= nums[i]
        right *= nums[nums.count - 1 - i]
    }
        
    return ans
}

print(productExceptSelf([5, 4, 3, 2, 6]))


