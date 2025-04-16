//
//  main.swift
//  Array MaxProfit
//
//  Created by Mamun on 15/4/25.
//

import Foundation

//https://leetcode.com/problems/best-time-to-buy-and-sell-stock

func maxProfit(_ prices: [Int]) -> Int {
    
    var profit = 0
    var buy = prices[0]
    
    for i in 1..<prices.count {
        if prices[i] > buy {
            profit = max(profit, prices[i] - buy)
        }
        
        buy = min(buy, prices[i])
    }
    
    return profit
}

//print(maxProfit([7, 1, 5, 3, 6, 4]))
print(maxProfit([7,6,4,3,1]))
