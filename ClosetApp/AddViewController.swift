//
//  AddViewController.swift
//  ClosetApp
//
//  Created by Yamamoto Miu on 2020/10/01.
//

import UIKit

class AddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var cameraImageView: UIImageView! //選択した画像を入れるためのImageViewを用意
    
    //画像加工するための元となる画像
    var originalImage: UIImage!
    //画像加工するフィルターの宣言
    var filter: CIFilter!
    //加工後の画像の宣言
    var editedImage: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //画面が見えるようになるときに呼ばれる
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            
            //actionSheetの生成
            let actionSheet = UIAlertController(title: "", message: "", preferredStyle: UIAlertController.Style.actionSheet)
            
            //1つ目のactionボタンが押されたときの処理
            let takePhotoAction = UIAlertAction(title: "写真を撮る", style: UIAlertAction.Style.default, handler: {
                (action:UIAlertAction!) in
                //実際の処理
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    //カメラを起動
                    let picker = UIImagePickerController()
                    picker.sourceType = .camera
                    picker.delegate = self
                    
                    picker.allowsEditing = true
                    
                    self.present(picker, animated: true, completion: nil)
                }else{
                    //カメラが使えない時はエラーを表示
                    print("error")
                }
            })
            
            //2つ目のactionボタンが押されたときの処理
            let openLibraryAction = UIAlertAction(title: "ライブラリから選択", style: UIAlertAction.Style.default, handler: {
                (action:UIAlertAction!) in
                //実際の処理
                if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                    
                    //カメラロールの画像を選択・表示
                    let picker = UIImagePickerController()
                    picker.sourceType = .photoLibrary
                    picker.delegate = self
                    
                    picker.allowsEditing = true
                    
                    self.present(picker, animated: true, completion: nil)
                }
            })
            
            // 閉じるボタンが押された時の処理をクロージャ実装する
            //UIAlertActionのスタイルがCancelなので赤く表示される
            let closeAction = UIAlertAction(title: "閉じる", style: UIAlertAction.Style.destructive, handler: {
                (action: UIAlertAction!) in
                //実際の処理
                print("閉じる")
            })
            
            //UIAlertControllerにタイトル1ボタンとタイトル2ボタンと閉じるボタンのActionを追加
            actionSheet.addAction(takePhotoAction)
            actionSheet.addAction(openLibraryAction)
            actionSheet.addAction(closeAction)
        
            // iPadでは必須！
            actionSheet.popoverPresentationController?.sourceView = self.view
            // xは画面中央、yは画面下部になる様に指定
        actionSheet.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.width/2, y: self.view.bounds.height, width: 0, height: 0)

            //実際にAlertを表示する
            self.present(actionSheet, animated: true, completion: nil)
        }
    
    //選択した画像をアプリ内に表示するためのメソッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        cameraImageView.image = info[.editedImage] as? UIImage
        
        //撮った画像を加工前のoriginalImageとして記憶しておく
        originalImage = cameraImageView.image
        //加工前の画像でもSaveItemViewに渡せるように.........
        editedImage = originalImage
        
        dismiss(animated: true, completion: nil)
    }
    
    //フィルター加工action
    @IBAction func filter1(_ sender: Any) {
        colorFilter()
    }
    @IBAction func filter2(_ sender: Any) {
        colorFilter()
    }
    @IBAction func filter3(_ sender: Any) {
        colorFilter()
    }
    
    
    
    //フィルター加工するためのメソッド
    func colorFilter() {
        let filterImage: CIImage = CIImage(image: originalImage)!
        
        //フィルターの設定
        filter = CIFilter(name: "CIColorControls")!
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        
        //彩度
        filter.setValue(1.0, forKey: "inputSaturation")
        //明度
        filter.setValue(0.5, forKey: "inputBrightness")
        //コントラスト
        filter.setValue(2.0, forKey: "inputContrast")
        
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
//        cameraImageView.image = UIImage(cgImage: cgImage!)
        //加工後の画像をeditedImageとする
        editedImage = UIImage(cgImage: cgImage!)
        cameraImageView.image = editedImage //cameraImageViewにeditedImageを表示
        
        
    }
    
    //segueを準備するときに呼ばれるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSaveItemView" {
            let saveItemViewController = segue.destination as! SaveItemViewController
            saveItemViewController.editedImage = self.editedImage
        }
    }
    
    

}
