//
//  UIViewController+Util.swift
//  IOSSample
//
//  Created by Hosung.Kim on 2021/11/22.
//

import UIKit

// MARK: - Public Outter Class, Struct, Enum, Protocol
enum ViewControllerEnum : String, CaseIterable {
    case calculator

}

extension UIViewController {

    // MARK: - Public Method
    class func getViewController(viewControllerEnum:ViewControllerEnum) -> UIViewController {
        switch viewControllerEnum {
        case .calculator :
            return getViewController(storyboard: "Calculator", identifier: String(describing: CalculatorViewController.self), modalPresentationStyle: .fullScreen)
        }
    }
    class func getViewController(viewController: String) -> UIViewController {
        switch viewController {
        case "Calculator" :
            return getViewController(storyboard: "Calculator", identifier: String(describing: CalculatorViewController.self), modalPresentationStyle: .fullScreen)
        case "Useful Website" :
            return getViewController(storyboard: "UsefulWebsite", identifier: String(describing: UsefulWebsiteViewController.self), modalPresentationStyle: .fullScreen)
        case "Do it! Swift" :
            return getViewController(storyboard: "DoitSwift", identifier: String(describing: DoitSwiftViewController.self), modalPresentationStyle: .fullScreen)
            
            
        case "Hello, world!" :
            return getViewController(storyboard: "HelloWorld", identifier: String(describing: HelloWorldViewController.self), modalPresentationStyle: .fullScreen)
        case "Bulb" :
            return getViewController(storyboard: "Bulb", identifier: String(describing: BulbViewController.self), modalPresentationStyle: .fullScreen)
        case "Gallery" :
            return getViewController(storyboard: "Gallery", identifier: String(describing: GalleryViewController.self), modalPresentationStyle: .fullScreen)
        case "Date Picker" :
            return getViewController(storyboard: "DatePicker", identifier: String(describing: DatePickerViewController.self), modalPresentationStyle: .fullScreen)
        case "Image Roulette" :
            return getViewController(storyboard: "ImageRoulette", identifier: String(describing: ImageRouletteViewController.self), modalPresentationStyle: .fullScreen)
        case "Lamp" :
            return getViewController(storyboard: "Lamp", identifier: String(describing: LampViewController.self), modalPresentationStyle: .fullScreen)
        case "Web" :
            return getViewController(storyboard: "Web", identifier: String(describing: WebViewController.self), modalPresentationStyle: .fullScreen)
        case "Map" :
            return getViewController(storyboard: "Map", identifier: String(describing: MapViewController.self), modalPresentationStyle: .fullScreen)
        
        
        
        default :
            return UIViewController()
        }
    }
    
    // MARK: - Private Method
    private class func getViewController(storyboard:String, identifier:String, modalPresentationStyle:UIModalPresentationStyle) -> UIViewController {
        let sb = UIStoryboard(name: storyboard, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: identifier)
        vc.modalPresentationStyle = modalPresentationStyle
        return vc
    }
}
