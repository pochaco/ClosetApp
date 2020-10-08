//
//  SaveItemViewController.swift
//  ClosetApp
//
//  Created by Yamamoto Miu on 2020/10/03.
//

import UIKit
import RealmSwift

class SaveItemViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //pickerViewの設定
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoryTextField.text = categoryArray[row]
    }

    //画像表示部分の宣言
    @IBOutlet weak var cameraImageView: UIImageView!
    var editedImage: UIImage!
    
    //入力部の宣言
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    
    //pickeViewの宣言
    var pickerView = UIPickerView()
    //pickerViewのoptions
    let categoryArray = ["Tops","Outer","Bottoms","Shoes","Accessory","Others"]
    
    var date:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)

        //cameraImageViewにeditedImageを表示
        cameraImageView.image = editedImage
        
        //デリゲート設定
        nameTextField.delegate = self
        brandTextField.delegate = self
        
        //pickerViewの作成
        createPickerView()
    }
    
    //テキストフィールドのReturnボタンが押されたときにキーボードを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func createPickerView() {
        pickerView.delegate = self
        categoryTextField.inputView = pickerView
        let toolbar = UIToolbar()
        toolbar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44)
        let doneButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(SaveItemViewController.donePicker))
        toolbar.setItems([doneButtonItem], animated: true)
                categoryTextField.inputAccessoryView = toolbar
        
    }
    
    @objc func donePicker() {
        categoryTextField.endEditing(true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           categoryTextField.endEditing(true)
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
        items.category = self.categoryTextField.text!
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
