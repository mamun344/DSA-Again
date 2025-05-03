//
//  main.swift
//  Binary
//
//  Created by Admin on 30/4/25.
//

import Foundation


func decimalToBinary(_ n: UInt32)->String {
    var s = ""
    var res = n

    while (res != 0) {
        s.append((res % 2).description)
        res = res / 2
    }
    
    return String(s.reversed())
}

func binaryToDecimal(_ n: String)->Int {
    var value : Int = 0
    let chars = Array(n)
    let count = chars.count
    
    for (i, d) in chars.enumerated() {
        guard let digit = Int(String(d)), digit != 0 else { continue }
        value += (pow(2, count-i-1) as NSDecimalNumber).intValue
    }
    
    return value
}

func uniqueChars(_ n:String)->Int {
    var bitMask: UInt32 = 0
    
    for c in n {
        let shiftValue: UInt32 = 1 << (Int(c.asciiValue!) - 97)
        print(shiftValue)
        print(decimalToBinary(shiftValue))

        bitMask |= shiftValue
        print(decimalToBinary(bitMask))
        print(bitMask)
    }
    
    var count = 0
    
    while bitMask != 0 {
        if bitMask & 1 == 1 {
            count += 1
        }
        
        bitMask >>= 1
    }
    
    print(count)
    return count
}

uniqueChars("abcdefghijklmnopqrstuvwxyz")

print(decimalToBinary(3))
print(binaryToDecimal("11"))

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
    print(decimalToBinary(UInt32(c.asciiValue!)))
    
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

