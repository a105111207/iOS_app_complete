//
//  GameViewModel.swift
//  lab09
//
//  Created by User on 2021/5/19.
//

import SwiftUI

class GameViewModel: ObservableObject {
    @Published var player: Card?
    @Published var computer: Card?
    @Published var result: GameResult?
    @Published var pi: String = "stone"
    @Published var ci: String = "stone"
    
    var cards: [Card] = {
        var cards = [Card]()
        for rank in Card.Rank.allCases {
            let card = Card(rank: rank)
            cards.append(card)
        }
        return cards
    }()
    
    func start() {
        cards.shuffle()
        player = cards[0]
        computer = cards[1]
        result = checkResult()
        
        let playerRankIndex = Card.Rank.allCases.firstIndex(of: player!.rank)!
        let cumputerRankIndex = Card.Rank.allCases.firstIndex(of: computer!.rank)!
        
        if playerRankIndex == 2 {
            pi = "scissor"
        } else if playerRankIndex == 1 {
            pi = "stone"
        } else {
            pi = "paper"
        }
        
        if cumputerRankIndex == 2 {
            ci = "scissor"
        } else if cumputerRankIndex == 1 {
            ci = "stone"
        } else {
            ci = "paper"
        }
    }
    
    func checkResult() -> GameResult {
        let playerRankIndex = Card.Rank.allCases.firstIndex(of: player!.rank)!
        let cumputerRankIndex = Card.Rank.allCases.firstIndex(of: computer!.rank)!
        if playerRankIndex == cumputerRankIndex {
            return .tie
        } else if playerRankIndex == 0 && cumputerRankIndex == 2 {
            return .win
        } else if playerRankIndex == 1 && cumputerRankIndex == 0 {
            return .win
        } else if playerRankIndex == 2 && cumputerRankIndex == 1 {
            return .win
        } else {
            return .lose
        }
    }
}
