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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        //使用するカスタムセルの登録
        let nib = UINib(nibName: "CustomCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "CustomCell")
        
//        // セルの大きさを設定
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: collectionView.frame.width, height: 100)
//        collectionView.collectionViewLayout = layout
    
    }

    //配置するcellの個数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    //cellの設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath)
        //画像を設定
        let items: Item = Item()
        let cellImage = items.pickupImage()
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
