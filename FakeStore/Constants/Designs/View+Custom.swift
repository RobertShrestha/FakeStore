//
//  View+Custom.swift
//  TingTing
//
//  Created by Aximpro Innovations GmbH on 12/29/20.
//

import UIKit
import os
import VideoToolbox
// Custom view with circular corner radius
class CircularCorneredView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        initialize()
    }
    func initialize() {
        self.layer.cornerRadius = self.layer.frame.height/2
        self.backgroundColor = ColorConstants.secondaryGray
        self.layer.borderColor = ColorConstants.primaryGray.cgColor
        self.layer.borderWidth = 0
        self.clipsToBounds = true
        self.updateConstraintsIfNeeded()
    }
}

// Custom view with circular corner radius
class CallButtonView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        initialize()
    }
    func initialize() {
        self.layer.cornerRadius = self.layer.frame.height/2
        self.clipsToBounds = true
        self.updateConstraintsIfNeeded()
    }
}
/// Custom stackl
class CustomStackView: UIStackView {
    public override func layoutSubviews() {
            super.layoutSubviews()
            initialize()
        }
    override func draw(_ rect: CGRect) {
        super.draw(rect)

    }
    func initialize() {
        self.layer.cornerRadius = 8.0
        self.backgroundColor = .clear
        self.layer.borderColor = ColorConstants.primaryGray.cgColor
        self.layer.borderWidth = 1
        self.clipsToBounds = true
        self.updateConstraintsIfNeeded()
    }
    func addBorder(color: UIColor, backgroundColor: UIColor, thickness: CGFloat) {
            let insetView = UIView(frame: bounds)
            insetView.backgroundColor = backgroundColor
            insetView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            insertSubview(insetView, at: 0)

            let borderBounds = CGRect(
                x: thickness,
                y: thickness,
                width: frame.size.width - thickness * 2,
                height: frame.size.height - thickness * 2)

            let borderView = UIView(frame: borderBounds)
            borderView.backgroundColor = color
            borderView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            insertSubview(borderView, at: 0)
        }
    /// show error by change border color
    func showError() {
        self.layer.borderColor = ColorConstants.secondayPink.cgColor
    }
    /// hide error by change border color
    func hideError() {
        self.layer.borderColor = ColorConstants.primaryGray.cgColor
    }
}

