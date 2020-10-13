//
//  CoordinateViewController.swift
//  ClosetApp
//
//  Created by Yamamoto Miu on 2020/09/30.
//

import UIKit
import RealmSwift

class CoordinateViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!

    //cellのimage
    var cellImage: UIImage?
//    //モデルクラスを取得し、取得データを格納する変数を作成
//    var itemCells: Results<Item>!
    
    let realm = try! Realm()
    //モデルクラスをインスタンス化
    let items: Item = Item()
    let coordinates: Coordinate = Coordinate()
    
    //配列の宣言
    var initialFileNameArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
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
        layout.itemSize = CGSize(width: 130, height: 130)
        layout.sectionInset = UIEdgeInsets(top: 35,left: 35,bottom: 35,right: 35)
        collectionView.collectionViewLayout = layout
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //配列の初期化
        initialFileNameArray = []
        //Coordinateクラスのデータを全件取得
        let coordinates = realm.objects(Coordinate.self)
        for coordinate in coordinates {
            //コーデのアイテムセットを取得
            let itemUnit = coordinate.coordinateItems
            //アイテムセットの一つ目のアイテムのfileNameを取得
            var fileName = itemUnit[0].fileName
            initialFileNameArray.append(fileName)
        }
        
        print(initialFileNameArray)
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
    
 
    
//    //cellのタップを感知した時に呼ばれるメソッド
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let cell: CustomCollectionViewCell = collectionView.cellForItem(at: indexPath) as? CustomCollectionViewCell else { return }
//
//        //indexpath.rowを取得
//        cellIndexPath = indexPath.row
//        //アイテム詳細画面に遷移する
//        performSegue(withIdentifier: "toDetailsView", sender: nil)
//    }


}

