//
//  ViewController.swift
//  homework02
//
//  Created by 1422 on 2021/3/15.
///Users/a1422/Desktop/homework02/homework02/ViewController.swift

import UIKit

class ViewController: UIViewController {


    @IBOutlet var cardButton: [UIButton]!
    @IBOutlet weak var text: UILabel!
    
    var openoff = [false, false, false, false, false, false, false, false]
    var emojis = ["👻", "🎃", "🍤", "🍰", "🌸", "🦋", "🐳", "🐶"]
    var flips = 0
    
    @IBAction func touchCards(_ sender: UIButton) {
        if let cardIndex = cardButton.firstIndex(of: sender){
            let emoji = emojis[cardIndex]
            
            var j = 0
            while j < 8 {
                if sender == cardButton[j] && openoff[j] != true{
                    sender.setTitle(emojis[j], for: UIControl.State.normal)
                    sender.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                    openoff[j] = true
                } else if sender == cardButton[j] && openoff[j] == true{
                    sender.setTitle("", for: UIControl.State.normal)
                    sender.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
                    openoff[j] = false
                }
                j+=1
            }
            flips += 1
            text.text = "FLIPs: " + String(flips)
        }
    }
    
    func setflip(){
        var i = 0
        while i < 8 {
            cardButton[i].setTitle("", for: UIControl.State.normal)
            cardButton[i].backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            i += 1
        }
    }
    
    @IBAction func Flipall(_ sender: Any) {
        flips = 0
        text.text = "FLIPs: " + String(flips)
        setflip()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setflip()
    }
}

