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
    
    //モデルクラスを取得し、取得データを格納する変数を作成
    var itemCells: Results<Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Realmインスタンス取得
        let realm = try! Realm()
        //データ全件取得
        self.itemCells = realm.objects(Item.self)
        
        collectionView.dataSource = self
        //使用するカスタムセルの登録
        let nib = UINib(nibName: "CustomCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "CustomCell")
        
//        // セルの大きさを設定
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: collectionView.frame.width, height: 100)
//        collectionView.collectionViewLayout = layout
    }

    //cellの数を指定
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.itemCells.count
    }
    //cellに値を設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath)
        let tmpCell: Item = self.itemCells[(indexPath as NSIndexPath).row]
        var cellImage: UIImage = loadImageFromDocumentDirectory(fileName: tmpCell.fileName)!
        cell.backgroundView = UIImageView(image: cellImage)
        return cell
    }
    
    
    //fileNameからUIImageを取り出すメソッド
    func loadImageFromDocumentDirectory(fileName: String) -> UIImage? {

        let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!;
        let fileURL = documentsUrl.appendingPathComponent(fileName)
        do {
            let imageData = try Data(contentsOf: fileURL)
            return UIImage(data: imageData)
        } catch {}
        return nil
        }
    
}
