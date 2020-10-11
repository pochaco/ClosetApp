//
//  CustomCollectionViewCell.swift
//  ClosetApp
//
//  Created by Yamamoto Miu on 2020/10/08.
//
import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    let checkmarkImage: UIImage = UIImage(named: "checkmark")!
    var checkmarkView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.checkmarkView = UIImageView(image: self.checkmarkImage)
    
    }
    
    
    var isMarked: Bool = false {
        didSet {
            if isMarked {
                self.contentView.addSubview(self.checkmarkView!)
                
             
//                checkmarkView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
//                checkmarkView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
//                checkmarkView.widthAnchor.constraint(equalToConstant: 26).isActive = true
//                checkmarkView.heightAnchor.constraint(equalToConstant: 26).isActive = true
   
            }
            else {
                self.checkmarkView?.removeFromSuperview()
            }
        }
    }

}
