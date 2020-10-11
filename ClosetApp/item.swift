//
//  item.swift
//  ClosetApp
//
//  Created by Yamamoto Miu on 2020/10/03.
//

import UIKit
import RealmSwift


class Coordinate: Object {
    @objc dynamic var coordinateName: String = ""
    let items = List<Item>()
}

class Item: Object {
   
    //Itemクラスの項目を設定
    @objc dynamic var name: String = ""
    @objc dynamic var brand: String = ""
    @objc dynamic var category: String = ""
    @objc dynamic var fileName: String = ""
    
    //同じitemを持つcoordinateの一覧を取得できる
    let coordinates = LinkingObjects(fromType: Coordinate.self, property: "items")
    //fileNameをオブジェクトのユニークな値（primaryKey）として保存
    override static func primaryKey() -> String? {
        return "fileName"
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



