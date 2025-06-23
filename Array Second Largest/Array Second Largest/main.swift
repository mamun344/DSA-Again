//
//  main.swift
//  Array Second Largest
//
//  Created by Admin on 31/5/25.
//

import Foundation


func find(_ arr: [Int])->Int? {
    guard arr.count > 1 else {
        return nil
    }
    
    var small = min(arr[0], arr[1])
    var large = max(arr[0], arr[1])
    
    for value in arr[2...] {
        if value < small, value < large {
            continue
        }
        
        if value > large {
            small = large
            large = value
        }
        else if value > small {
            small = value
        }
    }

    return small
}

var arr = [1, 2, 3 , 4, 5, 6, 7]
//arr = [15, 10, 12, 18, 11, 13, 17, 9]
//arr.reverse()
print(find(arr))
