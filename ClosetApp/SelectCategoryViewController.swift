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
    
    //各ボタンタップ時に送る信号となる変数
    var sign: String = ""
    
    
    

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
        sign = "Tops"
        perfomeSegue()
    }
    @IBAction func tapOuterButton() {
        sign = "Outer"
        perfomeSegue()
    }
    @IBAction func tapBottomsButton() {
        sign = "Bottoms"
        perfomeSegue()
    }
    @IBAction func tapShoesButton() {
        sign = "Shoes"
        perfomeSegue()
    }
    @IBAction func tapAccessoryButton() {
        sign = "Accessory"
        perfomeSegue()
    }
    @IBAction func tapOthersButton() {
        sign = "Others"
        perfomeSegue()
    }
    
    func perfomeSegue() {
        performSegue(withIdentifier: "toItemsView", sender: self.sign)
    }
    
    //画面遷移をするときに呼ばれるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toItemsView" {
            let itemsViewController = segue.destination as! ItemsViewController
            itemsViewController.sign = sender as! String
        }
    }
    
    
    
    

   

}
