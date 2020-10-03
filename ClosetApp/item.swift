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
    
    
//    @objc dynamic var _image: UIImage? = nil
//    @objc dynamic var image: UIImage? {
//        set {
//            self._image = newValue
//            if let value = newValue {
//                //PNG形式としてNSDataに変換
//                self.imageData = value.pngData() as NSData?
//            }
//        }
//        get {
//            if let image = self._image {
//                return image
//            }
//            if let data = self.imageData {
//                self._image = UIImage(data: data as Data)
//                return self._image
//            }
//            return nil
//        }
//    }
//
//    //NSDataの箱を用意
//    dynamic private var imageData: NSData? = nil

}
