//
//  ViewController.swift
//  Navigation
//
//  Created by 오지훈 on 23/12/2019.
//  Copyright © 2019 JiHoon Oh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    
    var isOn = true
    var isZoom = false
    var checkZoom = false

    @IBOutlet var txMessage: UITextField!
    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = imgOn
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "segue : use button"
        } else if segue.identifier == "editBarButton" {
            editViewController.textWayValue = "segue : use Bar button"
        }
        editViewController.textMessage = txMessage.text!
        editViewController.isOn = isOn
        editViewController.delegate = self
        editViewController.isZoom = isZoom
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imageView.image = imgOn
            self.isOn = true
        } else {
            imageView.image = imgOff
            self.isOn = false
        }
    }
    
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool, checkZoom: Bool) {
        let scale:CGFloat = 2.0
        var newWidth:CGFloat, newHeight:CGFloat
        
        if checkZoom {
            if isZoom {
                newWidth = imageView.frame.width * scale
                newHeight = imageView.frame.height * scale
                self.isZoom = true
            } else {
                newWidth = imageView.frame.width / scale
                newHeight = imageView.frame.height / scale
                self.isZoom = false
            }
            imageView.frame.size = CGSize(width: newWidth, height: newHeight)
        }
        
    }

}

