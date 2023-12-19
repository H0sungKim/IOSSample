//
//  UIViewController+Util.swift
//  NetworkSample
//
//  Created by 김기훈 on 2021/11/22.
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
        case "UsefulWebsite" :
            return getViewController(storyboard: "UsefulWebsite", identifier: String(describing: UsefulWebsiteViewController.self), modalPresentationStyle: .fullScreen)
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
