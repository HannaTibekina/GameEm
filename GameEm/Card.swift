//
//  Card.swift
//  GameEm
//
//  Created by Анна Тибекина on 13.05.2022.
//

import Foundation

struct Card{
    
    var isFaceUp = false
    var isMathed = false
    var identifire: Int
    
    static var identifireNumber = 0
    
    static func identifireCenerator() -> Int{
        identifireNumber += 1
        return  identifireNumber
    }
        
        init() {
            self.identifire = Card.identifireCenerator()
        }
    
}
