//
//  SelectCategoryViewController.swift
//  ClosetApp
//
//  Created by Yamamoto Miu on 2020/10/07.
//

import UIKit
import RealmSwift

class SelectCategoryViewController: UIViewController {
    
    //モデルクラスをインスタンス化
    let items: Item = Item()
    
    //ボタンパーツの宣言
    @IBOutlet weak var topsButton: UIButton!
    @IBOutlet weak var outerButton: UIButton!
    @IBOutlet weak var bottomsButton: UIButton!
    @IBOutlet weak var shoesButton: UIButton!
    @IBOutlet weak var accessoryButton: UIButton!
    @IBOutlet weak var othersButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        //サムネイル風に
//        //Realmインスタンス取得
//        let realm = try! Realm()
//        //データ全件取得
//        let results = realm.objects(Item.self)
//        //データの0番目の画像を取り出す
//        let firstFileName = results[0].fileName
//        let cellImage: UIImage? = items.loadImageFromDocumentDirectory(fileName: firstFileName)
//        topsButton.setImage(cellImage, for: .normal)
        
 
        

        //ボタンの背景画像設定
        topsButton.setImage(UIImage(named: "drumImage"), for: .normal)
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapTopsButton() {
        //〇〇というメッセージを次の画面に送る-それ次第で表示内容変更みたいな
    }
    

   

}
