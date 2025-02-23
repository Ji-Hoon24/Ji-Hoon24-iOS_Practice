//
//  ViewController.swift
//  Alert
//
//  Created by 오지훈 on 18/12/2019.
//  Copyright © 2019 JiHoon Oh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    let imgRev = UIImage(named: "lamp-remove.png")
    var isLampOn = true
    
    @IBOutlet var lampImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lampImg.image = imgOn
    }
    @IBAction func btnLampOn(_ sender: UIButton) {
        if(isLampOn) {
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On 상태입니다.", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        } else {
            lampImg.image = imgOn
            isLampOn = true
        }
    }
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        if(isLampOn) {
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: {ACTION in self.lampImg.image = self.imgOff
                self.isLampOn = false})
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            present(lampOffAlert, animated: true, completion: nil)
        } else {
            let lampOffAlert = UIAlertController(title: "경고", message: "현재 Off 상태입니다.", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            lampOffAlert.addAction(offAction)
            present(lampOffAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnLampRemove(_ sender: Any) {
        let lampRemoveAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let offAction = UIAlertAction(title: "아니오, 끕니다(Off)", style: UIAlertAction.Style.default, handler: {ACTION in self.lampImg.image = self.imgOff
            self.isLampOn = false})
        let onAction = UIAlertAction(title: "아니오, 켭니다(On)", style: UIAlertAction.Style.default, handler: {ACTION in self.lampImg.image = self.imgOn
            self.isLampOn = true})
        let removeAction = UIAlertAction(title: "제거합니다.", style: UIAlertAction.Style.default, handler: {ACTION in self.lampImg.image = self.imgRev
            self.isLampOn = false
        })
        
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        present(lampRemoveAlert, animated: true, completion: nil)
    }
}

