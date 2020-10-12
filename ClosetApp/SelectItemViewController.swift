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
    let coordinates: Coordinate = Coordinate()
    
    //インスタンスの取得
    let realm = try! Realm()
    
    var indexArray: [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        //delegate先を指定
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //任意のカテゴリのデータ全件取得
        self.itemCells = realm.objects(Item.self)
        
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
            let index = indexPath.row
            indexArray.append(index)
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
        for index in indexArray {
            try! realm.write{
                //選択されたitemをcoordinatesインスタンスに入れる
                coordinates.coordinateItems.append(itemCells[index])
                coordinates.coordinateName = "コーディネート名"
                realm.add(coordinates)
            }
        }
        
        //alertを出す
        let alert: UIAlertController = UIAlertController(title: "保存", message: "コーディネートを保存しました", preferredStyle: .alert)
        //OKボタン
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            _ in
            self.dismiss(animated:true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
     }
}
 
