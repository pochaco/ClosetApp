//
//  AddViewController.swift
//  ClosetApp
//
//  Created by Yamamoto Miu on 2020/10/01.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var cameraImageView: UIImageView! //選択した画像を入れるためのImageViewを用意
    
    
    
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
                print("カメラ起動の処理")
            })
            
            //2つ目のactionボタンが押されたときの処理
            let openLibraryAction = UIAlertAction(title: "ライブラリから選択", style: UIAlertAction.Style.default, handler: {
                (action:UIAlertAction!) in
                //実際の処理
                print("ライブラリを開く処理")
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

            //実際にAlertを表示する
            self.present(actionSheet, animated: true, completion: nil)
        }

}
