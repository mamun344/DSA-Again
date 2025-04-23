//
//  main.swift
//  Array Search Sorted Rotated
//
//  Created by Admin on 23/4/25.
//

import Foundation


func binarySearch(_ a: [Int], v: Int)->Int {
    
    var left = 0, right = a.count - 1
    
    while left <= right {
        let mid = (left + right) / 2
        
        guard a[mid] != v else {
            return mid
        }
        
        if v > a[mid] {
            left = mid + 1
        }
        else {
            right = mid - 1
        }
    }
    
    return -1
}


func rotatedBinarySearch(_ nums: [Int], target: Int)->Int {
    
    var left = 0, right = nums.count - 1
    
    while left <= right {
        let mid = (left + right) / 2
        
        guard nums[mid] != target else {
            return mid
        }
        
        // assuming left part is sorted
        
        if nums[left] <= nums[mid] {
            // if left part is sorted
            if target >= nums[left] && target <= nums[mid] {
                // check in left part
                right = mid
            }
            else {
                // should check in right part
                left = mid + 1
            }
        }
        else { // assuming right part is sorted
            
            // if right part is sorted
            if target >= nums[mid] && target <= nums[right] {
                // check in right part
                left = mid
            }
            else {
                // should check in left part
                right = mid - 1
            }
        }
    }
    
    return -1
}

print(rotatedBinarySearch([4, 5, 6, 7, 0, 1, 2], target: 0))
//print(rotatedBinarySearch([3, 1], t: 1))
//print(rotatedBinarySearch([5, 1, 2, 3, 4], t: 1))
