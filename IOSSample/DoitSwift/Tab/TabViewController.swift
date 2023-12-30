//
//  TabViewController.swift
//  IOSSample
//
//  Created by Hosung.Kim on 2023/12/29.
//

import UIKit

class TabViewController: UITabBarController {

    private var imageRouletteVC: ImageRouletteViewController?
    private var galleryVC: GalleryViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        imageRouletteVC = UIViewController.getViewController(viewController: "Image Roulette") as! ImageRouletteViewController
        let imageRouletteTabBarItem = UITabBarItem(title: "Image Roulette", image: UIImage(named: "photo"), tag: 0)
        imageRouletteVC!.tabBarItem = imageRouletteTabBarItem
        galleryVC = UIViewController.getViewController(viewController: "Gallery") as! GalleryViewController
        let galleryTabBarItem = UITabBarItem(title: "Gallery", image: UIImage(named: "photo"), tag: 1)
        galleryVC!.tabBarItem = galleryTabBarItem
        viewControllers = [imageRouletteVC!, galleryVC!]
    }

}

extension TabViewController: UITabBarControllerDelegate {
    
}
