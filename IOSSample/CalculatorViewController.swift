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
        NSLog("\(sender.tag)")
    }
    
}
