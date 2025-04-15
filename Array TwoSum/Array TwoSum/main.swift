//
//  main.swift
//  Array TwoSum
//
//  Created by Mamun on 15/4/25.
//

import Foundation


func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    var map: [Int: Int] = [:]
    
    for i in 0..<nums.count {
        let u = target - nums[i]
        
        if let ind = map[u] {
            return [ind, i]
        }
        else {
            map[nums[i]] = i
        }
    }
    
    return []
}

print(twoSum([2, 7, 11, 15], 9))
