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
    @objc dynamic var fileName: String = ""
    
}
