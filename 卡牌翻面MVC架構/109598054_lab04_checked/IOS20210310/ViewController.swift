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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var emojis = ["👻", "🎃", "🍤", "🍰", "🌸", "🦋", "🐳", "🐶"]
    lazy var game: MatchingGame = MatchingGame(numberPairsofCards: cardButtons.count)  //after UI ready then get
    var flipCount: Int = 0 {
        didSet{  //can't use lazy
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojl(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0):#colorLiteral(red: 1, green: 0.6044757962, blue: 0, alpha: 1)
            }
        }
    }
    
    func emojl(for card: Card) -> String {
        return String(emojis[card.identifier-1])
    }
        
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("not")
        }
        flipCount += 1
    }
    
    @IBAction func flipAll(_ sender: Any) {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            var card = game.cards[index]
            card.isFaceUp = false
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.6044757962, blue: 0, alpha: 1)
            game.clearCard(at: index)
        }
        flipCount = 0
    }
}

