//
//  HelloWorldViewController.swift
//  IOSSample
//
//  Created by Hosung.Kim on 2023/12/23.
//

import UIKit

class HelloWorldViewController: UIViewController {

    @IBOutlet weak var lblGreeting: UILabel!
    @IBOutlet weak var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func sendOnClick(_ sender: Any) {
        lblGreeting.text = "Welcome! " + txtName.text!
    }
}
