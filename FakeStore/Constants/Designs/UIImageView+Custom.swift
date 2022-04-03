//
//  UIImageView+Custom.swift
//  TingTing
//
//  Created by Aximpro Innovations GmbH on 2/10/21.
//  
import Foundation
import UIKit
/// For circular image view
class CircularImageView: UIImageView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = self.frame.size.width/2
        self.clipsToBounds = true
    }
}
