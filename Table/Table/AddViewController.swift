//
//  AddViewController.swift
//  Table
//
//  Created by 오지훈 on 26/12/2019.
//  Copyright © 2019 JiHoon Oh. All rights reserved.
//

import UIKit



class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var tfAddItem: UITextField!
    @IBOutlet var btnAddItem: UIButton!
    @IBOutlet var imagePicker: UIPickerView!
    @IBOutlet var imageView: UIImageView!
    let PICKER_VIEW_COLUMN = 1
    let PICKER_VIEW_HEIGHT:CGFloat = 80
    var itemsImageFile2 = ["cart.png", "clock.png", "pencil.png"]
    var imageArray = [UIImage?]()
    var selectedImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for i in 0 ..< itemsImageFile2.count {
            let image = UIImage(named: itemsImageFile2[i])
            imageArray.append(image)
        }
        
        imageView.image = imageArray[0]
        selectedImage = itemsImageFile2[0]
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!)
        itemsImageFile.append(selectedImage)
        tfAddItem.text=""
        _ = navigationController?.popViewController(animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return itemsImageFile.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image:imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)

        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //오른쪽 picker를 변경하면 이미지만 변경
        imageView.image = imageArray[row]
        selectedImage = itemsImageFile2[row]
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
