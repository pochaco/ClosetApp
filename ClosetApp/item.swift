//
//  item.swift
//  ClosetApp
//
//  Created by Yamamoto Miu on 2020/10/03.
//

import UIKit
import RealmSwift

class Item: Object {
   
    //Itemクラスの項目を設定
    @objc dynamic var name: String = ""
    @objc dynamic var brand: String = ""
    @objc dynamic var category: String = ""
    @objc dynamic var fileName: String = ""
    
//    //realmからデータを取り出す
//    func pickupImage() -> UIImage {
//        let realm = try! Realm()
//        let results = realm.objects(Item.self)
//        var imageList: UIImage!
//        for result in results {
//            imageList = loadImageFromDocumentDirectory(fileName: result.fileName)
//        }
//        return imageList
//    }
    
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
    
class Coordinate: Object {
    @objc dynamic var coordinateTitle: String = ""
    //Listの定義
    let itemIndexes = List<ItemIndex>()
}

class ItemIndex: Object {
    @objc dynamic var itemIndex: Int = 0
}


