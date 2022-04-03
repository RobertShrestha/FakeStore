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
    /// Change the text field with red color and have i icon in the testfield
    func showError() {
        rightViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        imageView.contentMode = .scaleAspectFit
        containerView.addSubview(imageView)
        imageView.image = #imageLiteral(resourceName: "ErrorIcon")
        imageView.tintColor = .lightGray
        rightView = containerView
        self.layer.borderColor = ColorConstants.secondayPink.cgColor
        self.textColor = ColorConstants.secondayPink
    }
    /// Reverse the effect to showing error
    func hideError() {
        rightView = nil
        self.textColor = ColorConstants.text
        self.layer.borderColor = ColorConstants.primaryGray.cgColor
    }
}
/// Input TextField without border
class InputTextFieldWithOutBorder: UITextField {
    override func prepareForInterfaceBuilder() {
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
    override func awakeFromNib() {
        super.awakeFromNib()
        initialize()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    func initialize() {
        self.backgroundColor = .clear
        self.font = FontConstants.textFieldText
        self.textColor = ColorConstants.primaryBlue
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "",
                                                        attributes: [NSAttributedString.Key
                                                                        .foregroundColor: ColorConstants.primaryGray])
    }
    func showError() {
        rightViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        imageView.contentMode = .scaleAspectFit
        containerView.addSubview(imageView)
        imageView.image = #imageLiteral(resourceName: "ErrorIcon")
        imageView.tintColor = .lightGray
        rightView = containerView
        self.textColor = ColorConstants.secondayPink
    }
    func hideError() {
        self.textColor = ColorConstants.text
        rightView = nil
    }
}

/// Dropdown TextField
class DropDownTextField: UITextField {
    override func prepareForInterfaceBuilder() {
        initialize()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
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
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= 20
        return textRect
    }
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    /// Initialize the textfield
    func initialize() {
        self.addRightArrow()
        self.backgroundColor = .clear
        self.font = FontConstants.textFieldText
        self.textColor = ColorConstants.primaryBlue
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "",
                                                        attributes: [NSAttributedString.Key
                                                                        .foregroundColor: ColorConstants.primaryGray])
        self.layer.borderWidth = 1.0
        self.layer.borderColor = ColorConstants.primaryGray.cgColor
        self.layer.cornerRadius = 8.0
    }
    // show error effect
    func showError() {
        rightViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        imageView.contentMode = .scaleAspectFit
        containerView.addSubview(imageView)
        imageView.image = #imageLiteral(resourceName: "ErrorIcon")
        imageView.tintColor = .lightGray
        rightView = containerView
        self.layer.borderColor = ColorConstants.secondayPink.cgColor
        self.textColor = ColorConstants.secondayPink
        imageView.isUserInteractionEnabled = false
        rightView?.isUserInteractionEnabled = false
        containerView.isUserInteractionEnabled = false
    }
    /// Reverse the effect to showing error
    func hideError() {
        rightView = nil
        addRightArrow()
        self.textColor = ColorConstants.text
        self.layer.borderColor = ColorConstants.primaryGray.cgColor
    }
    /// Add right arrow
    func addRightArrow() {
        rightViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        imageView.contentMode = .scaleAspectFit
        containerView.addSubview(imageView)
        imageView.image = #imageLiteral(resourceName: "ChevronRightIcon")
        imageView.tintColor = .lightGray
        rightView = containerView
        imageView.isUserInteractionEnabled = false
        rightView?.isUserInteractionEnabled = false
        containerView.isUserInteractionEnabled = false
    }
}
/// Search TextField
class SearchTextField: UITextField {
    override func prepareForInterfaceBuilder() {
        initializeLabel()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += 20
        return textRect
    }
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    func initializeLabel() {
        self.addArrow()
        self.backgroundColor = .white
        self.font = FontConstants.textFieldText
        self.textColor = ColorConstants.text
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "",
                                                        attributes: [NSAttributedString.Key
                                                                        .foregroundColor: ColorConstants.primaryGray])
        self.layer.cornerRadius = self.frame.height/2
        self.borderStyle = .none
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.shadowOpacity = 0.21 // opacity, 20%
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 5 // HALF of blur
        self.layer.shadowOffset = CGSize(width: 0, height: 2) // Spread x, y
        self.layer.masksToBounds = false
    }
    func addArrow() {
        leftViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        imageView.contentMode = .scaleAspectFit
        containerView.addSubview(imageView)
        imageView.image = #imageLiteral(resourceName: "TabBarInActiveSearchIcon")
        imageView.tintColor = .lightGray
        leftView = containerView
    }
    // show error effect
    func showError() {
        rightViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        imageView.contentMode = .scaleAspectFit
        containerView.addSubview(imageView)
        imageView.image = #imageLiteral(resourceName: "ErrorIcon")
        imageView.tintColor = .lightGray
        rightView = containerView
        self.layer.borderColor = ColorConstants.secondayPink.cgColor
        self.textColor = ColorConstants.secondayPink
    }
    /// Reverse the effect to showing error
    func hideError() {
        rightView = nil
        rightViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        imageView.contentMode = .scaleAspectFit
        containerView.addSubview(imageView)
        imageView.image = #imageLiteral(resourceName: "ChevronRightIcon")
        imageView.tintColor = .lightGray
        rightView = containerView
        self.textColor = ColorConstants.text
        self.layer.borderColor = ColorConstants.primaryGray.cgColor
    }
}

/// Search TextField
class SearchTextFieldWithClose: UITextField {
    var closeButtonTapped: (() -> Void)?
    override func prepareForInterfaceBuilder() {
        initializeLabel()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += 20
        return textRect
    }
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    func initializeLabel() {
        self.addArrow()
        self.addCross()
        self.backgroundColor = .white
        self.font = FontConstants.textFieldText
        self.textColor = ColorConstants.text
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "",
                                                        attributes: [NSAttributedString.Key
                                                                        .foregroundColor: ColorConstants.primaryGray])
        self.layer.cornerRadius = self.frame.height/2
        self.borderStyle = .none
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.shadowOpacity = 0.21 // opacity, 20%
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 5 // HALF of blur
        self.layer.shadowOffset = CGSize(width: 0, height: 2) // Spread x, y
        self.layer.masksToBounds = false
    }
    func addArrow() {
        leftViewMode = UITextField.ViewMode.always
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        imageView.contentMode = .scaleAspectFit
        containerView.addSubview(imageView)
        imageView.image = #imageLiteral(resourceName: "TabBarInActiveSearchIcon")
//        imageView.isSkeletonable = true
//        imageView.isHiddenWhenSkeletonIsActive = true
//        imageView.startSkeletonAnimation()
//        imageView.showAnimatedSkeleton()
        imageView.tintColor = .lightGray
//        leftView?.isSkeletonable = true
//        leftView?.isHiddenWhenSkeletonIsActive = true
        leftView = containerView
    }
    func addCross() {
        rightViewMode = UITextField.ViewMode.whileEditing
        let imageView = UIImageView(frame: CGRect(x: 0, y: 2.5, width: 15, height: 15))
        let closeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
        closeButton.addTarget(self, action: #selector(closeButtonTapped(sender:)), for: .touchUpInside)
        imageView.contentMode = .scaleAspectFit
        containerView.addSubview(imageView)
        containerView.addSubview(closeButton)
        imageView.image = #imageLiteral(resourceName: "BlackCrossIcon")
        imageView.tintColor = .lightGray
        rightView = containerView
    }
    @objc func closeButtonTapped(sender: UIButton) {
        if self.closeButtonTapped != nil {
            self.closeButtonTapped!()
        }
    }
    // show error effect
    func showError() {
        rightViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        imageView.contentMode = .scaleAspectFit
        containerView.addSubview(imageView)
        imageView.image = #imageLiteral(resourceName: "ErrorIcon")
        imageView.tintColor = .lightGray
        rightView = containerView
        self.layer.borderColor = ColorConstants.secondayPink.cgColor
        self.textColor = ColorConstants.secondayPink
    }
    /// Reverse the effect to showing error
    func hideError() {
        rightView = nil
        rightViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        imageView.contentMode = .scaleAspectFit
        containerView.addSubview(imageView)
        imageView.image = #imageLiteral(resourceName: "ChevronRightIcon")
        imageView.tintColor = .lightGray
        rightView = containerView
        self.textColor = ColorConstants.text
        self.layer.borderColor = ColorConstants.primaryGray.cgColor
    }
}
