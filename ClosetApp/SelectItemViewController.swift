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
        
        //インスタンスの取得
        let realm = try! Realm()

        //delegate先を指定
        collectionView.delegate = self
        
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
        layout.sectionInset = UIEdgeInsets(top: 20,left: 20,bottom: 20,right: 20)
        collectionView.collectionViewLayout = layout
        
        //cellの複数選択を許可
        self.collectionView.allowsMultipleSelection = true
        
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
    
    // Cell がタップで選択されたときに呼ばれる
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell: CustomCollectionViewCell = collectionView.cellForItem(at: indexPath) as? CustomCollectionViewCell else { return }
 
        if self.collectionView.allowsMultipleSelection {
            cell.isMarked = true
        }
    }
    
    // Cell がタップで選択解除されたときに呼ばれる
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell: CustomCollectionViewCell = collectionView.cellForItem(at: indexPath) as? CustomCollectionViewCell else { return }
        
        if self.collectionView.allowsMultipleSelection {
            cell.isMarked = false
        }
    }
    
    @IBAction func cancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func done() {
        //複数選択されているアイテムのindexPathをindexPathsとする
        var indexPaths = collectionView.indexPathsForSelectedItems!
        //昇順に並べ替える
        indexPaths.sort { $0 < $1 }
        
        for indexPath in indexPaths {

            let index = indexPath.row
            
//            //Realmインスタンス取得
//            let realm = try! Realm()
//
//            //Coordinateモデルのインスタンスの作成
//            let coordinate = Coordinate()
//
//            coordinate.itemIndexes = String[itemIndexes]
//
//            //書き込み処理
//            try! realm.write {
//                realm.add(coordinate.self)
//            }
 
        
//            let asset = assets.object(at: index)
//
//            imageManager.requestImage(for: asset, targetSize: thumbnailSize, contentMode: .aspectFill, options: nil, resultHandler: { image, _ in
//                if image == nil {
//                    print("managerError")
//                } else {
//                    self.items.append(image! as UIImage)
//                }
//            })

        }
        self.dismiss(animated: true, completion: nil)
    }
}
 