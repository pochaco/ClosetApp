//
//  SaveItemViewController.swift
//  ClosetApp
//
//  Created by Yamamoto Miu on 2020/10/03.
//

import UIKit
import RealmSwift

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
     
    }
    
    //テキストフィールドのReturnボタンが押されたときにキーボードを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func saveItem(_ sender: Any) {

        //モデルクラスをインスタンス化
        let items: Item = Item()
        
        //それぞれの項目にデータを追加
        items.name = self.nameTextField.text!
        items.brand = self.brandTextField.text!
//        items.image = editedImage
        
        //realmのインスタンス化
        let realm = try! Realm()

        //realmにデータを追加保存
        try! realm.write {
            realm.add(items)
        }
       
        //alertを出す
        let alert: UIAlertController = UIAlertController(title: "保存", message: "アイテムの保存が完了しました", preferredStyle: .alert)
        
        //OKボタン
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            _ in
            self.dismiss(animated:true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
        
//        //初期化
//        cameraImageView.image = nil
//        nameTextField.text = ""
//        brandTextField.text = ""
//
    }
    
    

}
