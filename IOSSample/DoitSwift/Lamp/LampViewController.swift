//
//  LampViewController.swift
//  IOSSample
//
//  Created by Hosung.Kim on 2023/12/26.
//

import UIKit

class LampViewController: UIViewController {
    
    let lampRemoved: Int = 0
    let lampOff: Int = 1
    let lampOn: Int = 2
    
    var lampStatus: Int = 1

    @IBOutlet weak var ivLamp: UIImageView!
    
    let imgLampOn: UIImage = UIImage(named: "lamp_on.png")!
    let imgLampOff: UIImage = UIImage(named: "lamp_off.png")!
    let imgLampRemove: UIImage = UIImage(named: "lamp-remove.png")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ivLamp.image = imgLampOff
    }
    
    @IBAction func onClickOn(_ sender: Any) {
        switch lampStatus {
        case lampRemoved :
            break
        case lampOff :
            ivLamp.image = imgLampOn
            lampStatus = lampOn
        case lampOn :
            let alertLampOn: UIAlertController = UIAlertController(title: "Warning", message: "Lamp is already on.", preferredStyle: .alert)
            let action: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertLampOn.addAction(action)
            present(alertLampOn, animated: true, completion: nil)
        default :
            break
        }
    }
    
    @IBAction func onClickOff(_ sender: Any) {
        if lampStatus == lampOn {
            let alertLampOff: UIAlertController = UIAlertController(title: "Turn off the lamp", message: "Do you want to turn off the lamp?", preferredStyle: .alert)
            let actionCancel: UIAlertAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            let actionOk: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
                self.ivLamp.image = self.imgLampOff
                self.lampStatus = self.lampOff
            })
            alertLampOff.addAction(actionCancel)
            alertLampOff.addAction(actionOk)
            present(alertLampOff, animated: true, completion: nil)
        }
    }
    
    @IBAction func onClickRemove(_ sender: Any) {
        if lampStatus != lampRemoved {
            let alertLampRemove: UIAlertController = UIAlertController(title: "Remove the lamp", message: "Do you want to remove the lamp?", preferredStyle: .alert)
            let actionRemove: UIAlertAction = UIAlertAction(title: "Yes. Remove", style: .default, handler: { _ in
                self.ivLamp.image = self.imgLampRemove
                self.lampStatus = self.lampRemoved
            })
            let actionOn: UIAlertAction = UIAlertAction(title: "No. Turn on", style: .default, handler: { _ in
                self.ivLamp.image = self.imgLampOn
                self.lampStatus = self.lampOn
            })
            let actionOff: UIAlertAction = UIAlertAction(title: "No. Turn off", style: .default, handler: { _ in
                self.ivLamp.image = self.imgLampOff
                self.lampStatus = self.lampOff
            })
            alertLampRemove.addAction(actionRemove)
            alertLampRemove.addAction(actionOn)
            alertLampRemove.addAction(actionOff)
            present(alertLampRemove, animated: true, completion: nil)
        }
    }
    
}
