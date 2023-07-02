//
//  ViewController.swift
//  IOS20210310
//
//  Created by 1422 on 2021/3/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cardButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var emojis = ["🦅", "🦉", "🐺", "🐍", "🦌", "🦈"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardIndex = cardButtons.firstIndex(of: sender){
            let emoji = emojis[cardIndex]
            if sender.currentTitle == "🦅"{
                sender.setTitle("", for: UIControl.State.normal)
                sender.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            } else{
                sender.setTitle("🦅", for: UIControl.State.normal)
                sender.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            }
        }
    }
}

