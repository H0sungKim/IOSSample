//
//  BulbViewController.swift
//  IOSSample
//
//  Created by Hosung.Kim on 2023/12/23.
//

import UIKit

class BulbViewController: UIViewController {

    @IBOutlet weak var imgvBulb: UIImageView!
    @IBOutlet weak var btnZoom: UIButton!
    
    var isZoom: Bool = false
    let imgBulbOff: UIImage = UIImage(named: "lamp_off.png")!
    let imgBulbOn: UIImage = UIImage(named: "lamp_on.png")!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgvBulb.image = imgBulbOff
    }
    @IBAction func zoomOnClick(_ sender: Any) {
        let scale: CGFloat = 2.0
        var newWidth: CGFloat
        var newHeight: CGFloat
        if isZoom {
            newWidth = imgvBulb.frame.width / scale
            newHeight = imgvBulb.frame.height / scale
            btnZoom.setTitle("Zoom In", for: .normal)
        } else {
            newWidth = imgvBulb.frame.width * scale
            newHeight = imgvBulb.frame.height * scale
            btnZoom.setTitle("Zoom Out", for: .normal)
        }
        imgvBulb.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    
    @IBAction func bulbSwitch(_ sender: UISwitch) {
        if sender.isOn {
            imgvBulb.image = imgBulbOn
        } else {
            imgvBulb.image = imgBulbOff
        }
    }
}
