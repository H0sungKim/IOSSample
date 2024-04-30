//
//  ImageRouletteViewController.swift
//  IOSSample
//
//  Created by Hosung.Kim on 2023/12/24.
//

import UIKit

class ImageRouletteViewController: UIViewController {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var ivImage: UIImageView!
    
    private let imageCount: Int = 7
    
    private var imageArray: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<imageCount {
            imageArray.append(UIImage(named: "\(i).jpeg")!)
        }
        setUI(index: 0)
    }
    
    private func setUI(index: Int) {
        lbTitle.text = "Selected Image : \(index)"
        ivImage.image = imageArray[index]
        lbTitle.sizeToFit()
    }
    
}

extension ImageRouletteViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageCount
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        setUI(index: row)
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let ivPickerComponent: UIImageView = UIImageView(image: imageArray[row])
        ivPickerComponent.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        return ivPickerComponent
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
}
