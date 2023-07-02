//
//  MatchingGame.swift
//  IOS20210310
//
//  Created by 1422 on 2021/3/17.
//

import Foundation

class MatchingGame {
    var s = 0
    var cards = [Card]()
    var emojiDict = [String] ()
    var indexOfOneAndOnlyFaceUpCard: Int?
    func chooseCard(at index: Int) {
        if !cards[index].isMatched{
            if let mathIndex = indexOfOneAndOnlyFaceUpCard, mathIndex != index {
                let emojimath = mathIndex + 1
                let emojiindex = index + 1
                if emojiDict[emojimath] == emojiDict[emojiindex]{
                    cards[mathIndex].isMatched = true
                    cards[index].isMatched = true
                    s += 5
                } else {
                    s -= 1
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
        for _ in 1...16 { //don't care about i
            let card = Card()
            cards.append(card)  //or card+=[card, card]
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
