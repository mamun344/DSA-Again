//
//  main.swift
//  Array MaxSubarry
//
//  Created by Mamun on 16/4/25.
//

import Foundation

//https://leetcode.com/problems/maximum-subarray

/// Kadane's Algorithm
//https://www.geeksforgeeks.org/largest-sum-contiguous-subarray/


func maxSubArray(_ nums: [Int]) -> Int {

    var sum: Int = nums[0]
    var maxSum: Int = nums[0]
    
    for i in 1..<nums.count {
        print(nums[i], sum, sum + nums[i])
        sum = max(nums[i], sum + nums[i]) // not clear 
        maxSum = max(maxSum, sum)
        print(maxSum)
    }
    
    return maxSum
}

print(maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4]))
//print(maxSubArray([-2, 1, -3, -5, -1, 2, 1, 0, 4]))

