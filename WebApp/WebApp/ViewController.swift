//
//  ViewController.swift
//  WebApp
//
//  Created by 오지훈 on 20/12/2019.
//  Copyright © 2019 JiHoon Oh. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet var loading: UIActivityIndicatorView!
    @IBOutlet var webView: WKWebView!
    
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        webView.load(myRequest)
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading), options: .new, context: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loadWebPage("https://m.naver.com")
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "loading" {
            if webView.isLoading {
                loading.startAnimating()
                loading.isHidden = false
            } else {
                loading.stopAnimating()
                loading.isHidden = true
            }
        }
    }
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
}

