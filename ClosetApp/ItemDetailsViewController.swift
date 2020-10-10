//
//  ItemDetailsViewController.swift
//  ClosetApp
//
//  Created by Yamamoto Miu on 2020/10/05.
//

import UIKit

class ItemDetailsViewController: UIViewController {

    //パーツの宣言
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    
    var itemImage: UIImage?
    var itemName: String = "Name"
    var itemBrand: String = "Brand"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //受け取った値をそれぞれ表示
        imageView.image = itemImage
        nameLabel.text = itemName
        brandLabel.text = itemBrand
   
    }

}
