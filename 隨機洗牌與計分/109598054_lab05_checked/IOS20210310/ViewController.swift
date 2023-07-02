//
//  ViewController.swift
//  IOS20210310
//
//  Created by 1422 on 2021/3/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet weak var Score: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var emojis = ["👻", "👻", "🎃", "🎃", "🍤", "🍤", "🍰", "🍰", "🌸", "🌸", "🦋", "🦋", "🐳", "🐳", "🐶", "🐶"]
    var emojiDict = Dictionary<Int, String> ()
    
    
    lazy var game: MatchingGame = MatchingGame(numberPairsofCards: (cardButtons.count + 1))  //after UI ready then get
    var flipCount: Int = 0 {
        didSet{  //can't use lazy
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    var flipall = true
    var emojiIndex = [String]()
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojl(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            } else {
                if card.isMatched == false {
                    button.setTitle("", for: UIControl.State.normal)
                    button.backgroundColor = #colorLiteral(red: 0.9394426942, green: 0.496761322, blue: 0.3522388637, alpha: 1)
                } else {
                    button.setTitle(emojl(for: card), for: UIControl.State.normal)
                    button.backgroundColor = #colorLiteral(red: 0.9394426942, green: 0.496761322, blue: 0.3522388637, alpha: 0.4897959184)
                }
            }
        }
    }
    
    var emojiShuffled = true
    func emojl(for card: Card) -> String {
        if emojiShuffled == true {
            emojis = emojis.shuffled()
            emojis.insert("?", at: 0)
            emojiShuffled = false
        }
        for i in 0...16 {
            if emojiDict[i] == nil{
                emojiDict[i] = emojis[i]
            }
        }
        game.emojiDict = emojis
        return emojiDict[card.identifier] ?? "?"
    }
        
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("not")
        }
        flipCount += 1
        Score.text = "Score: \(game.s)"
    }
    
    func clearEmojl(for card: Card) -> String {
        if emojiDict[card.identifier] != nil, emojis.count > 0 {
            emojiDict[card.identifier] = nil
        }
        return emojiDict[card.identifier] ?? "?"
    }
    
    @IBAction func resetCards(_ sender: Any) {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.9394426942, green: 0.496761322, blue: 0.3522388637, alpha: 1)
            clearEmojl(for: card)
            game.clearCard(at: index)
        }
        flipCount = 0
        game.s = 0
        emojis = ["👻", "👻", "🎃", "🎃", "🍤", "🍤", "🍰", "🍰", "🌸", "🌸", "🦋", "🦋", "🐳", "🐳", "🐶", "🐶"]
        emojiShuffled = true
        flipall = true
        Score.text = "Score: 0"
    }
    
    @IBAction func filpAll(_ sender: Any) {
        if flipall == true {
            flipall = false
            for index in cardButtons.indices {
                let button = cardButtons[index]
                let card = game.cards[index]
                button.setTitle(emojl(for: card), for: UIControl.State.normal)
                button.backgroundColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                game.flipAllCard(at: index, i: flipall)
            }
        } else {
            flipall = true
            for index in cardButtons.indices {
                let button = cardButtons[index]
                let card = game.cards[index]
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.9394426942, green: 0.496761322, blue: 0.3522388637, alpha: 1)
            }
        }
        flipCount = 0
        game.s = 0
        Score.text = "Score: 0"
    }
}

