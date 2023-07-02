//
//  MatchingGame.swift
//  IOS20210310
//
//  Created by 1422 on 2021/3/17.
//

import Foundation

class MatchingGame {
    var cards = [Card]()
    func chooseCard(at index: Int) {
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        }
    }
    
    init(numberPairsofCards: Int) {
        for _ in 1...numberPairsofCards { //don't care about i
            let card = Card()
            cards.append(card)  //or card+=[card, card]
            //cards.append(card)
        }
    }
    
    func clearCard(at index: Int) {
        cards[index].isFaceUp = false
    }
}
