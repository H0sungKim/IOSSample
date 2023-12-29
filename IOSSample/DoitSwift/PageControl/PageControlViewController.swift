//
//  PageControlViewController.swift
//  IOSSample
//
//  Created by Hosung.Kim on 2023/12/28.
//

import UIKit

class PageControlViewController: UIViewController {

    @IBOutlet weak var pcPages: UIPageControl!
    @IBOutlet weak var ivImage: UIImageView!
    
    let imageCount: Int = 7
    var imageArray: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<imageCount {
            imageArray.append((UIImage(named: "\(i).jpeg")!))
        }
        ivImage.image = imageArray[0]
        
        pcPages.numberOfPages = imageCount
        pcPages.currentPage = 0
        pcPages.pageIndicatorTintColor = UIColor.green
        pcPages.currentPageIndicatorTintColor = UIColor.red
    }
    @IBAction func pageChanged(_ sender: UIPageControl) {
        ivImage.image = imageArray[sender.currentPage]
    }
}
