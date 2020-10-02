//
//  SaveItemViewController.swift
//  ClosetApp
//
//  Created by Yamamoto Miu on 2020/10/03.
//

import UIKit

class SaveItemViewController: UIViewController, UITextFieldDelegate {

    
    //画像表示部分の宣言
    @IBOutlet weak var cameraImageView: UIImageView!
    var editedImage: UIImage!
    
    //text入力部の宣言
    @IBOutlet weak var nameTextField: UITextField! //Name入力部分
    @IBOutlet weak var brandTextField: UITextField! //Brand入力部分

    
    override func viewDidLoad() {
        super.viewDidLoad()

        //cameraImageViewにeditedImageを表示
        cameraImageView.image = editedImage
        
        //UITextFieldDeligateのデリゲートの所在をitemSaveViewController自身に指定する
        nameTextField.delegate = self
        brandTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    //テキストフィールドのReturnボタンが押されたときにキーボードを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

}
