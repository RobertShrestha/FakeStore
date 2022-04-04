//
//  TextField+Custom.swift
//  TingTing
//
//  Created by Aximpro Innovations GmbH on 1/26/21.
//  Copyright © 2021 Aximpro Innovations GmbH. All rights reserved.

import UIKit
import Foundation
private var rightViews = NSMapTable<UITextField, UIView>(keyOptions: NSPointerFunctions.Options.weakMemory,
                                                         valueOptions: NSPointerFunctions.Options.strongMemory)
private var errorViews = NSMapTable<UITextField, UIView>(keyOptions: NSPointerFunctions.Options.weakMemory,
                                                         valueOptions: NSPointerFunctions.Options.strongMemory)
/// Input TextField
class InputTextField: UITextField {
    override func prepareForInterfaceBuilder() {
        initialize()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    let padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 5)
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    func initialize() {
        self.backgroundColor = .clear
        // self.font = FontConstants.textFieldText
        self.font = AppFont.font(with: 14, family: Mulish.regular)

        self.textColor = ColorConstants.primaryBlue
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "",
                                                        attributes: [NSAttributedString.Key
                                                                        .foregroundColor: ColorConstants.primaryGray])
        self.layer.borderWidth = 1.0
        self.layer.borderColor = ColorConstants.primaryGray.cgColor
        self.layer.cornerRadius = 8.0
        self.updateConstraintsIfNeeded()

}
}
