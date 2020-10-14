//
//  CoordinateDetailsViewController.swift
//  ClosetApp
//
//  Created by Yamamoto Miu on 2020/10/11.
//

import UIKit
import RealmSwift


class CoordinateDetailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //cellのimage
    var cellImage: UIImage?
    
    let realm = try! Realm()
    //モデルクラスをインスタンス化
    let items: Item = Item()
    let coordinates: Coordinate = Coordinate()
    
    //cellの番号
    var cellIndexPath: Int = 0
    //配列の宣言
    var initialFileNameArray: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Coordinateクラスのデータを全件取得
        let coordinates = realm.objects(Coordinate.self)
        let coordinateItems = coordinates[cellIndexPath].coordinateItems
        for coordinateItem in coordinateItems {
            initialFileNameArray.append(coordinateItem.fileName)
        }

        //delegate先を指定
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //使用するカスタムセルの登録
        let nib = UINib(nibName: "CustomCollectionViewCell", bundle: nil)
        //cellに使われるクラスとしてCustomCellを登録
        collectionView.register(nib, forCellWithReuseIdentifier: "CustomCell")
        
        // セルの大きさを設定
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 35
        layout.itemSize = CGSize(width: 110, height: 110)
//        layout.sectionInset = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
        collectionView.collectionViewLayout = layout
        
    }
    
    //cellの数を指定
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return initialFileNameArray.count
    }
    //cellに値を設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CustomCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCollectionViewCell
    
        cellImage = items.loadImageFromDocumentDirectory(fileName: initialFileNameArray[indexPath.row])
        cell.backgroundView = UIImageView(image: cellImage)
        return cell
    }

   
}
