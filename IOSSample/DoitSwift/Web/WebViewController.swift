//
//  WebViewController.swift
//  IOSSample
//
//  Created by Hosung.Kim on 2023/12/27.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var tfUrl: UITextField!
    @IBOutlet weak var wvWeb: WKWebView!
    @IBOutlet weak var icvIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wvWeb.navigationDelegate = self
        loadWeb(url: "https://www.nasa.gov/")
    }
    
    private func loadWeb(url: String) {
        wvWeb.load(URLRequest(url: URL(string: url)!))
    }

    @IBAction func onClickSearch(_ sender: Any) {
        let url: String = tfUrl.text!
        if !(url.hasPrefix("https://")) {
            print("ifin")
            loadWeb(url: "https://\(url)")
        } else {
            loadWeb(url: url)
        }        
    }
    
    @IBAction func onClickSite1(_ sender: Any) {
        loadWeb(url: "https://github.com/H0sungKim")
    }
    @IBAction func onClickSite2(_ sender: Any) {
        loadWeb(url: "https://www.swift.org/")
    }
    @IBAction func onClickHtml(_ sender: Any) {
        let html: String = "<h1> HTML String </h1><p> String 변수를 이용한 웹 페이지 </p><p><a href=\"http://www.google.com\">Google</a>로 이동</p>"
        wvWeb.loadHTMLString(html, baseURL: nil)
    }
    @IBAction func onClickFile(_ sender: Any) {
        wvWeb.load(URLRequest(url: URL(fileURLWithPath: Bundle.main.path(forResource: "html", ofType: "html")!)))
    }
    
    @IBAction func onClickStop(_ sender: Any) {
        wvWeb.stopLoading()
    }
    @IBAction func onClickReload(_ sender: Any) {
        wvWeb.reload()
    }
    @IBAction func onClickBackward(_ sender: Any) {
        wvWeb.goBack()
    }
    @IBAction func onClickForward(_ sender: Any) {
        wvWeb.goForward()
    }
    
    
}

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        icvIndicator.startAnimating()
        icvIndicator.isHidden = false
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        icvIndicator.stopAnimating()
        icvIndicator.isHidden = true
    }
}
