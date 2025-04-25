//
//  main.swift
//  String: Anagram
//
//  Created by Admin on 25/4/25.
//

import Foundation


func decimalToBinary(_ n: Int)->String {
    var s = ""
    var res = n

    while (res != 0) {
        s.append((res % 2).description)
        res = res / 2
    }
    
    return String(s.reversed())
}

print(decimalToBinary(65))

var s = 7
var t = 5

let r = s ^ t

s = r ^ s
t = r ^ s

let str = "ABC"

var i = 0

var v = 0

for c in str {
    print(c.asciiValue, i)
    i += 1
    print(decimalToBinary(Int(c.asciiValue!)))
    
    if v == 0 {
        v = Int(c.asciiValue!)
    }
    else {
        v = v << 8
        v += Int(c.asciiValue!)
    }
}

let str2 = "ABD"

var u = 0

for c in str2 {
    if u == 0 {
        u = Int(c.asciiValue!)
    }
    else {
        u = u << 8
        u += Int(c.asciiValue!)
    }
}

print("comapre", v ^ u)

let x = pow(2, 4)
print(x)


func isAnagram(_ s: String, _ t: String) -> Bool {
    
    var map: [Character: Int] = [:]
    
    for c in s {
        map[c, default: 0] += 1
    }
    
    for c in t {
        guard let count = map[c] else {
            return false
        }
        
        if count == 1 {
            map[c] = nil
        } else {
            map[c]! -= 1
        }
    }
    
    return map.isEmpty
}
