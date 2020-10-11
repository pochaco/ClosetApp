//
//  CustomCollectionViewCell.swift
//  ClosetApp
//
//  Created by Yamamoto Miu on 2020/10/08.
//
import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    let checkmarkImage: UIImage = UIImage(named:"checkmark")!
    var checkmarkView: UIImageView!
    
    var isMarked: Bool = false {
        didSet {
            if isMarked {
                self.contentView.addSubview(self.checkmarkView!)
            }
            else {
                self.checkmarkView?.removeFromSuperview()
            }
        }
    }
    
    func clearCheckmark() -> Void {
        self.isMarked = false
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.checkmarkView = UIImageView(image: self.checkmarkImage)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }

}
