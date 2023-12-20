//
//  UsefulWebsiteViewController.swift
//  IOSSample
//
//  Created by 김기훈 on 2023/12/19.
//

import UIKit

class UsefulWebsiteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let titleText: [String] = ["The Swift Programming Language",
                               "The Swift Programming Language (Korean)",
                               "Xcode Help",
                               "Apple Developer Documentation",
                               "App Store Guidlines",
                               "swift.org",
                               "Kodeco Swift Style Guide",
                               "Google Swift Style",
                               "Apple Documentation Archive",
                               "Awesome Swift",
                               "Awesome iOS"
    ]
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell
        
        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: String(describing: CustomTableViewCell.self), for: indexPath) as? CustomTableViewCell {
            cell = reusableCell
        } else {
            let objectArray = Bundle.main.loadNibNamed(String(describing: CustomTableViewCell.self), owner: nil, options: nil)
            cell = objectArray![0] as! CustomTableViewCell
        }
        
        cell.labelTitle.text = titleText[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let url = URL(string: website(name: titleText[indexPath.row])), UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
    }
    
    func website(name: String) -> String {
        switch name {
        case "The Swift Programming Language" :
            return "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/"
        case "The Swift Programming Language (Korean)" :
            return "https://bbiguduk.gitbook.io/swift/"
        case "Xcode Help" :
            return "https://help.apple.com/xcode/mac/8.0/#/"
        case "Apple Developer Documentation" :
            return "https://developer.apple.com/documentation/"
        case "App Store Guidlines" :
            return "https://developer.apple.com/kr/app-store/guidelines/"
        case "swift.org" :
            return "https://www.swift.org/"
        case "Kodeco Swift Style Guide" :
            return "https://github.com/kodecocodes/swift-style-guide"
        case "Google Swift Style" :
            return "https://google.github.io/swift/"
        case "Apple Documentation Archive" :
            return "https://developer.apple.com/library/archive/navigation/"
        case "Awesome Swift" :
            return "https://github.com/matteocrippa/awesome-swift"
        case "Awesome iOS" :
            return "https://github.com/vsouza/awesome-ios"
        
        default:
            return ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
        tableView.register(UINib(nibName: String(describing: CustomTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: CustomTableViewCell.self))
    }
}
