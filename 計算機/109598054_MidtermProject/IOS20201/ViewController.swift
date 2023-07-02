//
//  ViewController.swift
//  IOS20201
//
//  Created by 1422 on 2021/2/24.
//

import UIKit

class ViewController: UIViewController {
    var numericArray = [String]() //numeric array
    var symbolArray = [String]() //symbol array
    var isOutputAws = false
    var isDot = false
    var isInputZero = true
    var isSymbol = false
    var isOpposite = false
    
    
    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var beforeInput: UILabel!
    
    //output button values
    func inputKey(valueKey: String) {
        if(result.text! == "0"){result.text! = valueKey}
        else{result.text! += valueKey}
        isInputZero = true
        isSymbol = false
    }
    
    func removeLastZore() {
        if isDot == true {
            while result.text!.last == "0" && result.text!.last != "." {
                result.text!.removeLast()
            }
            if result.text! == "" {
                result.text! = "0"
            }
        }
    }
    
    //output symbol and numeric to Label that names beforeInput
    func inputValueString(labelSign: String, sign: String) {
        if isOutputAws {
            beforeInput.text! = ""
            isOutputAws = false
            numericArray = []
            symbolArray = []
        }
        
        if result.text! == "" && isSymbol == true {
                beforeInput.text?.removeLast(3)
                symbolArray.removeLast()
                beforeInput.text! += labelSign
                symbolArray.append(sign)
        } else {
            if isOpposite == false {
                removeLastZore()
            }
            if result.text!.last == "." {
                result.text!.removeLast()
            }
            beforeInput.text! += result.text! + labelSign
            numericArray.append(result.text!)
            symbolArray.append(sign)
            result.text! = ""
        }
        
        isInputZero = false
        isDot = false
        isSymbol = true
        isOpposite = false
    }
    
    @IBAction func input_0(_ sender: Any) {
        inputKey(valueKey: "0")
    }
    @IBAction func input_1(_ sender: Any) {
        inputKey(valueKey: "1")
    }
    @IBAction func input_2(_ sender: Any) {
        inputKey(valueKey: "2")
    }
    @IBAction func input_3(_ sender: Any) {
        inputKey(valueKey: "3")
    }
    @IBAction func input_4(_ sender: Any) {
        inputKey(valueKey: "4")
    }
    @IBAction func input_5(_ sender: Any) {
        inputKey(valueKey: "5")
    }
    @IBAction func input_6(_ sender: Any) {
        inputKey(valueKey: "6")
    }
    @IBAction func input_7(_ sender: Any) {
        inputKey(valueKey: "7")
    }
    @IBAction func input_8(_ sender: Any) {
        inputKey(valueKey: "8")
        
    }
    @IBAction func input_9(_ sender: Any) {
        inputKey(valueKey: "9")
    }
    
    
    @IBAction func add(_ sender: Any) {
            inputValueString(labelSign: " \u{2B} ", sign: "+")
    }
    @IBAction func reduce(_ sender: Any) {
            inputValueString(labelSign: " \u{2D} ", sign: "-")
    }
    @IBAction func multiply(_ sender: Any) {
            inputValueString(labelSign: " \u{D7} ", sign: "*")
    }
    @IBAction func divide(_ sender: Any) {
            inputValueString(labelSign: " \u{F7} ", sign: "/")
    }
    
    @IBAction func opposite(_ sender: Any) {
        if result.text! != "" && result.text! != "0" {
            if(isOutputAws){
                numericArray = []
                symbolArray = []
                beforeInput.text! = ""
                isOutputAws = false
            }
            result.text! = String(Double(result.text!)! * -1)
            while result.text!.last == "0" {
                result.text!.removeLast()
            }
            if result.text!.last == "-" || result.text!.last == "." {
                if result.text!.last == "." {
                    isDot = false
                }
                result.text!.removeLast()
            }
            isOpposite = true
        }
    }
    
    @IBAction func dot(_ sender: Any) {
        if isDot == false {
            if result.text! == "" {
                result.text! = "0"
            }
            result.text! += "."
        }
        isDot = true
    }
    
    @IBAction func getPercentage(_ sender: Any) {
        result.text! = String(Double(result.text!)! / 100)
    }
    
    @IBAction func amount(_ sender: Any) {
        if result.text! != "" {
            numericArray.append(result.text!)
            inputValueString(labelSign: " \u{3D} ", sign: "=")
            symbolArray.removeLast()
            isOutputAws = true
            var countMD = 0.0       //count result
            var index = 0           //loop index
            
            //remove compelet count number of array
            func removeValue(){
                numericArray[index+1] = String(countMD)
                if numericArray[index+1] == "inf" || numericArray[index+1] == "-inf" {
                    numericArray[index+1] = "0"
                }
                numericArray.remove(at: index)
                symbolArray.remove(at: index)
            }
            
            //priority count symbol = "*" || "/"
            while index < symbolArray.count {
                switch symbolArray[index] {
                case "*":
                    countMD = Double(numericArray[index])! * Double(numericArray[index+1])!
                    removeValue()
                case "/":
                    countMD = Double(numericArray[index])! / Double(numericArray[index+1])!
                    removeValue()
                default:
                    index += 1
                    break
                }
            }
            //count symbol = "+" || "-"
            index = 0
            while symbolArray.count != 0 {
                switch symbolArray[index] {
                case "+":
                    countMD = Double(numericArray[index])! + Double(numericArray[index+1])!
                    removeValue()
                case "-":
                    countMD = Double(numericArray[index])! - Double(numericArray[index+1])!
                    removeValue()
                default:
                    break
                }
            }
            
            let aws = Double(numericArray[0])!
            let isInt = aws.truncatingRemainder(dividingBy: 1.0)
            if(isInt == 0.0) {
                result.text! = String(Int(aws))
            } else {
                result.text! = String(aws)
            }
            
            isSymbol = false
            isOpposite = false
        }
    }
    
    @IBAction func allClear(_ sender: Any) {
        numericArray = []
        symbolArray = []
        beforeInput.text! = ""
        result.text! = "0"
        isDot = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

