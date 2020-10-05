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
    
    var date:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)

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
        
        //時刻と日付(FileName)の取得
        date = dateToString()
        //ImageURLをDocumentDirectoryに保存
        saveImageInDocumentDirectory(image: editedImage, fileName: date)
        
        //モデルクラスをインスタンス化
        let items: Item = Item()
        
        //それぞれの項目にデータを追加
        items.name = self.nameTextField.text!
        items.brand = self.brandTextField.text!
        items.fileName = date
        
        //realmのインスタンス化
        let realm = try! Realm()
        //realmにデータを追加保存
        try! realm.write {
            realm.add(items.self)
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
    
    //UIimageにfileNameをつけてDocumentDirectoryに保存
    func saveImageInDocumentDirectory(image: UIImage, fileName: String) {

            let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = documentsUrl.appendingPathComponent(fileName)
        if let imageData = image.pngData() {
                try? imageData.write(to: fileURL, options: .atomic)
        }
    }
    

    func dateToString() -> String {
        /// DateFomatterクラスのインスタンス生成
        let dateFormatter = DateFormatter()
        /// 変換フォーマット定義（未設定の場合は自動フォーマットが採用される）
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        /// データ変換（Date→テキスト）
        let dateString = dateFormatter.string(from: Date())
        return dateString
    }
   
}
