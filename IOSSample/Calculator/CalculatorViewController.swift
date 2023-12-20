//
//  CalculatorViewController.swift
//  IOSSample
//
//  Created by 김기훈 on 2023/12/19.
//

import UIKit

class CalculatorViewController: UIViewController {
    enum ButtonTag: Int {
        case zeroButton = 0
        case oneButton
        case twoButton
        case threeButton
        case fourButton
        case fiveButton
        case sixButton
        case sevenButton
        case eightButton
        case nineButton
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var subButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var resultButton: UIButton!
    
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    
    @IBOutlet weak var decimalPointButton: UIButton!
    
    private var nowCalculate: String = "+"
    private var num1: Int = 0
    private var num2: Int = 0
    private var expression: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.textAlignment = .right
        
        zeroButton.tag = ButtonTag.zeroButton.rawValue
        oneButton.tag = ButtonTag.oneButton.rawValue
        twoButton.tag = ButtonTag.twoButton.rawValue
        threeButton.tag = ButtonTag.threeButton.rawValue
        fourButton.tag = ButtonTag.fourButton.rawValue
        fiveButton.tag = ButtonTag.fiveButton.rawValue
        sixButton.tag = ButtonTag.sixButton.rawValue
        sevenButton.tag = ButtonTag.sevenButton.rawValue
        eightButton.tag = ButtonTag.eightButton.rawValue
        nineButton.tag = ButtonTag.nineButton.rawValue
    }
    @IBAction func numberOnClick(_ sender: UIButton) {
        if num2 == -1 {
            num2 = 0
        }
        num2 *= 10
        num2 += sender.tag
        expression += String(sender.tag)
        resultLabel.text = expression
    }
    
    @IBAction func clearOnClick(_ sender: Any) {
        num1 = 0
        num2 = 0
        nowCalculate = "+"
        expression = ""
        resultLabel.text = "0"
    }
    
    @IBAction func calculateOnClick(_ sender: Any) {
        expression = "\(num1) \(nowCalculate) \(num2) = "
        calculate()
        expression += String(num1)
        resultLabel.text = expression
    }
    @IBAction func arithmeticOnClick(_ sender: UIButton) {
        let arithmetic = (sender.titleLabel?.text)!
        calculate()
        nowCalculate = arithmetic
        expression = "\(num1) \(nowCalculate) "
        resultLabel.text = expression
    }
    
    func calculate() {
        switch nowCalculate {
        case "+" :
            if num2 == -1 {
                num2 = 0
            }
            num1 = num1 + num2
        case "-" :
            if num2 == -1 {
                num2 = 0
            }
            num1 = num1 - num2
        case "*" :
            if num2 == -1 {
                num2 = 1
            }
            num1 = num1 * num2
        case "/" :
            if num2 == -1 {
                num2 = 1
            } else if num2 == 0 {
                num1 = 0
                num2 = 0
                nowCalculate = "+"
                expression = ""
                resultLabel.text = "Zero Division Error"
            }
            num1 = num1 / num2
        default:
            break
        }
        num2 = -1
    }
}
