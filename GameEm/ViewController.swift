//
//  ViewController.swift
//  GameEm
//
//  Created by Анна Тибекина on 12.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
   lazy var game = concentrationGame(numberOfPairsPfCard: (buttonCollection.count + 1) / 2)
    
    var touch = 0 {
        didSet {
            touchLabel.text = "Toutches: \(touch)"
        }
    }
    
    
    
    var emojiDictonari = [Int: String] ()
    
    func emojiIdentifire (for card: Card) -> String {
        if emojiDictonari[card.identifire] == nil{
            let rundomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emojiDictonari[card.identifire] = emojiCollection.remove(at: rundomIndex)
           
        }
        
        
        return emojiDictonari[card.identifire] ?? "?"
    }
    
    
   
    
    func updateViewFromModel() {
        for index in buttonCollection.indices{
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emojiIdentifire(for: card), for: .normal)
                button.backgroundColor = UIColor.white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMathed ? UIColor.white : UIColor.purple
            }
        }
    }
    
    
    var emojiCollection = ["🐱","🦊","🐻","🦖","🐝","🐵","🐥","🐬","🦧","🦒","🦩"]
    

    @IBOutlet var buttonCollection: [UIButton]!
    
    @IBOutlet weak var touchLabel: UILabel!
    
    @IBAction func buttonAction(_ sender: UIButton) {
        touch += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            game.choseCard(at: buttonIndex)
            updateViewFromModel()
        }
        
        
        
     
        
    }
    
}

