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
    var emojiDict = Dictionary<Int, String> ()
    
    
    lazy var game: MatchingGame = MatchingGame(numberPairsofCards: (cardButtons.count + 1) / 2)  //after UI ready then get
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
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1):#colorLiteral(red: 0.9394426942, green: 0.496761322, blue: 0.3522388637, alpha: 1)
            }
        }
    }
    
    func emojl(for card: Card) -> String {
        if emojiDict[card.identifier] == nil, emojis.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojis.count)))
            emojiDict[card.identifier] = emojis.remove(at: randomIndex)
        }
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
        /*if let cardIndex = cardButtons.firstIndex(of: sender){
            let emoji = emojis[cardIndex]
            if sender.currentTitle == emoji{
                sender.setTitle("", for: UIControl.State.normal)
                sender.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            } else{
                sender.setTitle(emoji, for: UIControl.State.normal)
                sender.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            }
            flipCount += 1
            
        }*/
    }
}

