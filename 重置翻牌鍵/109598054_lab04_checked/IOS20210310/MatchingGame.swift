//
//  MatchingGame.swift
//  IOS20210310
//
//  Created by 1422 on 2021/3/17.
//

import Foundation

class MatchingGame {
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    func chooseCard(at index: Int) {
        if !cards[index].isMatched{
            if let mathIndex = indexOfOneAndOnlyFaceUpCard, mathIndex != index {
                if cards[mathIndex].identifier == cards[index].identifier{
                    cards[mathIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                if let mathIndex = indexOfOneAndOnlyFaceUpCard, mathIndex == index {
                    cards[index].isFaceUp = false
                    indexOfOneAndOnlyFaceUpCard = nil
                } else{
                    cards[index].isFaceUp = true
                    indexOfOneAndOnlyFaceUpCard = index
                }
            }
        }
        /*if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        }*/
    }
    
    init(numberPairsofCards: Int) {
        for _ in 1...numberPairsofCards { //don't care about i
            let card = Card()
            cards.append(card)  //or card+=[card, card]
            cards.append(card)
        }
    }
    
    func clearCard(at index: Int) {
        cards[index].isFaceUp = false
        cards[index].isMatched = false
        indexOfOneAndOnlyFaceUpCard = nil
    }
    
    func flipAllCard(at index: Int, i:Bool) {
        cards[index].isFaceUp = i
        cards[index].isMatched = false
        indexOfOneAndOnlyFaceUpCard = nil
    }
}
