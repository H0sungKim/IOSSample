//
//  GalleryViewController.swift
//  IOSSample
//
//  Created by Hosung.Kim on 2023/12/23.
//

import UIKit

class GalleryViewController: UIViewController {
    let pictureCount = 7
    var index: Int = 0
    var imageArray: [UIImage] = []

    @IBOutlet weak var imgvPic: UIImageView!
    @IBOutlet weak var lblIndex: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<pictureCount {
            imageArray.append((UIImage(named: "\(i).jpeg")!))
        }
        imgvPic.image = imageArray[index]
    }
    
    @IBAction func backOnClick(_ sender: Any) {
        if index != 0 {
            index -= 1
            imgvPic.image = imageArray[index]
            lblIndex.text = "\(index+1)"
        }
    }
    
    @IBAction func nextOnClick(_ sender: Any) {
        if index != pictureCount - 1 {
            index += 1
            imgvPic.image = imageArray[index]
            lblIndex.text = "\(index+1)"
        }
    }
    
    
    
}
