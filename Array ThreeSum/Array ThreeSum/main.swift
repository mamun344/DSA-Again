//
//  main.swift
//  Array ThreeSum
//
//  Created by Admin on 23/4/25.
//

import Foundation


func allTwoSums(_ nums: [Int]) -> [[Int]] {
    
    var map: [Int: Int] = [:]
    var outputs = [[Int]]()
    
    for i in 0..<nums.count {
        let target = 0 - nums[i]
        
        if let ind = map[target], ind != i {
            outputs.append([ind, i])
        }
        else {
            map[nums[i]] = i
        }
    }
    
    return outputs
}



func threeSum(_ nums: [Int]) -> [[Int]] {

    var outputs = Set<[Int]>()
    var map: [Int: Int] = [:]
    var low = 0, high = 0, mid = 0
    
    for i in 0..<nums.count {
        let twoTarget = 0 - nums[i]
        map = [:]
        
        for j in 0..<nums.count where j != i {
            let target = twoTarget - nums[j]
            
            if let ind = map[target], ind != j {
                low = min(nums[i], min(nums[ind], nums[j]))
                high = max(nums[i], max(nums[ind], nums[j]))
                mid = nums[i] + nums[ind] + nums[j] - low - high
                
                outputs.insert([low, mid, high])
            }
            else {
                map[nums[j]] = j
            }
        }
    }
    
    return outputs.map { $0 }
}

print(threeSum([-1, 0, 1, 2, -1, -4]))
print(threeSum([0, 1, 0]))

//print(allTwoSums(([-1, 0, 1, 2, -1, -2, -4, 0])))

