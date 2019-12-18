//
//  ViewController.swift
//  imageViewer
//
//  Created by 오지훈 on 17/12/2019.
//  Copyright © 2019 JiHoon Oh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var btnPrev: UIButton!
    @IBOutlet var btnNext: UIButton!
    var correntView = 0;
    var imageName = ["01.png", "02.png", "03.png", "04.png", "05.png", "06.png"]
    var correntImg: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        correntImg = UIImage(named: imageName[0])
        imageView.image = correntImg
    }

    @IBAction func btnPreview(_ sender: UIButton) {
        if(correntView == 0) {
            correntView = imageName.count - 1
            correntImg = UIImage(named: imageName[correntView])
        } else {
            correntView = correntView - 1
            correntImg = UIImage(named: imageName[correntView])
        }
        imageView.image = correntImg
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        if(correntView == imageName.count - 1) {
            correntView = 0
            correntImg = UIImage(named: imageName[correntView])
        } else {
            correntView = correntView + 1
            correntImg = UIImage(named: imageName[correntView])
        }
        imageView.image = correntImg
    }
}

