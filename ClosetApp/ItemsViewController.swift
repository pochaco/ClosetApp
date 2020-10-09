//
//  ItemsViewController.swift
//  ClosetApp
//
//  Created by Yamamoto Miu on 2020/10/03.
//

import UIKit
import RealmSwift

class ItemsViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //categoryViewより受け取る変数の箱
    var sign: String  = ""
    
    //モデルクラスを取得し、取得データを格納する変数を作成
    var itemCells: Results<Item>!
    
    //モデルクラスをインスタンス化
    let items: Item = Item()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(sign)
        
        //Realmインスタンス取得
        let realm = try! Realm()
        //Topsのデータ全件取得
        self.itemCells = realm.objects(Item.self).filter("category == %@", sign)
        
        collectionView.dataSource = self
        //使用するカスタムセルの登録
        let nib = UINib(nibName: "CustomCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "CustomCell")
        
        // セルの大きさを設定
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 35
        layout.itemSize = CGSize(width: 135, height: 135)
        layout.sectionInset = UIEdgeInsets(top: 35,left: 35,bottom: 35,right: 35)
        collectionView.collectionViewLayout = layout
    }

    //cellの数を指定
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.itemCells.count
    }
    //cellに値を設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath)
        let tmpCell: Item = self.itemCells[(indexPath as NSIndexPath).row]
        let cellImage: UIImage? = items.loadImageFromDocumentDirectory(fileName: tmpCell.fileName)
        cell.backgroundView = UIImageView(image: cellImage)
        return cell
    }
    
    
}
