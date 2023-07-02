//
//  ViewController.swift
//  HelloWorld
//
//  Created by 1422 on 2021/2/25.
//
//
//Users/a1422/Desktop/HelloWorld/HelloWorld/ViewController.swift
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heighfield: UITextField!
    
    @IBOutlet weak var weightfield: UITextField!
    
    @IBOutlet weak var BMIfeild: UITextField!
    
    @IBOutlet weak var caculate: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func caaculate(_ sender: Any) {
        //resultLabel.text = String("output")
        let h = Float(heighfield.text!)!/100.0
        let w = Float(weightfield.text!)!
        let bmi = w / (h * h)
        BMIfeild.text = String(bmi)
        if(bmi <= 18.5) {
            resultLabel.text = String("體重過輕")
        }
        else if(bmi >= 24) {
            resultLabel.text = String("體重過重")
        }
        else {
            resultLabel.text = String("體重適中")
        }
    }
    
    /*override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }*/


}

