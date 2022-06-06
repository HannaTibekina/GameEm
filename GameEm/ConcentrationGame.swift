//
//  ConcentrationGame.swift
//  GameEm
//
//  Created by Анна Тибекина on 13.05.2022.
//

import Foundation

class concentrationGame{

    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func choseCard(at index: Int){
        if !cards[index].isMathed{
            if let mathingIndex = indexOfOneAndOnlyFaceUpCard, mathingIndex != index{
                if cards[mathingIndex].identifire == cards[index].identifire{
                    cards[mathingIndex].isMathed = true
                    cards[index].isMathed = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
                
            } else {
                for flipDown in cards.indices {
                    cards[flipDown].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsPfCard: Int) {
        for _ in 1...numberOfPairsPfCard {
            let card = Card()
            cards += [card, card]
        }
    }


}





