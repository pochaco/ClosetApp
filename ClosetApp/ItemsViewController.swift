//
//  ItemsViewController.swift
//  ClosetApp
//
//  Created by Yamamoto Miu on 2020/10/03.
//

import UIKit
import RealmSwift

class ItemsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    //カテゴリのラベル
//    let labelArray = ["Tops","Outer","Bottoms","Shoes","Accessory"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //fileNameをrealmから取り出す
        let realm = try! Realm()
        let results = realm.objects(Item.self)
        
//   //fileNameを参照してUIImageを取り出す
//     let itemImage = loadImageFromDocumentDirectory(fileName: fileName)
//
//        //UIImageをUIImageViewに表示
//        imageView.image = itemImage

    }
//
//
//    //表示するアイテム（カテゴリ）の数を設定
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 5
//    }
//    //スクリーンサイズに応じたセルサイズを返す
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        //横方向のスペース調整
//        let horizontalSpace: CGFloat = 2
//        let cellSize: CGFloat = self.view.bounds.width/2 - horizontalSpace
//        //正方形で返すためw,hを同じ値に
//        return CGSize(width: cellSize, height: cellSize)
//    }
//
//    //アイテム表示領域全体の上下左右の余白を設定
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return (self.view.frame.width/4)/3
//    }
//
//    //アイテムの表示内容
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        // アイテムを作成
//        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
//        //Tag番号を使ってImageViewのインスタンス作成
//        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
//        // 画像配列の番号で指定された要素の名前の画像をUIImageとする
//        let cellImage = UIImage(named: imageArray[indexPath.row])
//        // UIImageをUIImageViewのimageとして設定
//        imageView.image = cellImage
////        // Tag番号を使ってLabelのインスタンス生成
////        let label = cell.contentView.viewWithTag(2) as! UILabel
////        label.text = labelArray[indexPath.row]
//
//        return cell
//    }
    
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
