//
//  ViewController.swift
//  PageControl2
//
//  Created by 오지훈 on 23/12/2019.
//  Copyright © 2019 JiHoon Oh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lblPage: UILabel!
    @IBOutlet var PageCtl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        PageCtl.numberOfPages = 10
        PageCtl.currentPage = 0
        PageCtl.pageIndicatorTintColor = UIColor.green
        PageCtl.currentPageIndicatorTintColor = UIColor.red
        lblPage.text = String(PageCtl.currentPage + 1)
    }

    @IBAction func PageChange(_ sender: UIPageControl) {
        lblPage.text = String(PageCtl.currentPage + 1)
    }
    
}

