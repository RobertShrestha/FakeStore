//
//  UILabel+Custom.swift
//  TingTing
//
//  Created by Aximpro Innovations GmbH on 12/29/20.
//

import UIKit
// swiftlint:disable file_length
// MARK: - Bold UILabels
/// UILabel with font header and text color secondaryBlack
class HeaderLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
        // self.font = FontConstants.header
        self.font = AppFont.font(with: FontSize.xLarge.rawValue, family: Mulish.extraBold)
        self.textColor = ColorConstants.primaryBlue
        self.updateConstraintsIfNeeded()
    }
}
/// UILabel with font title and text color white
class ProductTitleLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
//        self.font = FontConstants.title
//        self.textColor = .white
        self.font = AppFont.font(with: FontSize.large.rawValue, family: Mulish.extraBold)
        self.textColor = ColorConstants.primaryBlue
        self.updateConstraintsIfNeeded()
    }
}
/// UILabel with font title and text color white
class ProductPriceLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
        self.font = AppFont.font(with: FontSize.medium.rawValue, family: Mulish.bold)
        self.textColor = ColorConstants.primaryBlue
        self.updateConstraintsIfNeeded()
    }
}
/// UILabel with font title and text color white
class ProductRatingLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
        self.font = AppFont.font(with: FontSize.lmedium.rawValue, family: Mulish.regular)
        self.textColor = ColorConstants.primaryBlue
        self.updateConstraintsIfNeeded()
    }
}
