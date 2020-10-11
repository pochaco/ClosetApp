//
//  SelectItemViewController.swift
//  ClosetApp
//
//  Created by Yamamoto Miu on 2020/10/11.
//

import UIKit
import RealmSwift

class SelectItemViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //cellのimage
    var cellImage: UIImage?
    
    //モデルクラスを取得し、取得データを格納する変数を作成
    var itemCells: Results<Item>!
    
    //モデルクラスをインスタンス化
    let items: Item = Item()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //delegate先を指定
        collectionView.delegate = self
        
        //Realmインスタンス取得
        let realm = try! Realm()
        //任意のカテゴリのデータ全件取得
        self.itemCells = realm.objects(Item.self)
        
        collectionView.dataSource = self
        
        //使用するカスタムセルの登録
        let nib = UINib(nibName: "CustomCollectionViewCell", bundle: nil)
        //cellに使われるクラスとしてCustomCellを登録
        collectionView.register(nib, forCellWithReuseIdentifier: "CustomCell")
        
        // セルの大きさを設定
        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 35
        layout.itemSize = CGSize(width: 100, height: 100)
//        layout.sectionInset = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
        collectionView.collectionViewLayout = layout
        
    }
    
    //cellの数を指定
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.itemCells.count
    }
    //cellに値を設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CustomCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCollectionViewCell
        
        let tmpCell: Item = self.itemCells[(indexPath as NSIndexPath).row]
        cellImage = items.loadImageFromDocumentDirectory(fileName: tmpCell.fileName)
        cell.backgroundView = UIImageView(image: cellImage)
        return cell
    }
    

}

