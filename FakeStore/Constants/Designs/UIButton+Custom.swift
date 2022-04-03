//
//  UIButton+Custom.swift
//  TingTing
//
//  Created by Aximpro Innovations GmbH on 12/29/20.
//

import UIKit
/// Link Button
class LinkButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    func initialize() {
        self.titleLabel?.font = FontConstants.setDefaultFont(withFont: .medium, withSize: .xsmall)
        self.setTitleColor(ColorConstants.primaryGray, for: .normal)
        self.updateConstraintsIfNeeded()
    }
}
/// Secondary button
class SecondaryButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    func initialize() {
        // self.titleLabel?.font = FontConstants.button
        self.setTitleColor(ColorConstants.primaryPink, for: .normal)
        self.updateConstraintsIfNeeded()
    }
}
/// Privacy button
class PrivacyButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    func initialize() {
        self.titleLabel?.font = FontConstants.privacyButton
        self.setTitleColor(ColorConstants.primaryPink, for: .normal)
    }
}
/// Privacy button
class AlertCancelButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    func initialize() {
        self.titleLabel?.font = FontConstants.alertButtonLightRegular
        self.setTitleColor(ColorConstants.primaryBlue, for: .normal)
    }
}
/// Privacy button
class AlertConfirmButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    func initialize() {
        self.titleLabel?.font = FontConstants.alertTileBold
        self.setTitleColor(ColorConstants.primaryBlue, for: .normal)
    }
}
/// Invite button
class InviteButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
        self.titleLabel?.font = FontConstants.contactNumber
        self.setTitleColor(ColorConstants.primaryBlack, for: .normal)
        self.updateConstraintsIfNeeded()
    }
    func invited() {
        self.setTitleColor(ColorConstants.reinviteColor, for: .normal)
    }
    func notInvited() {
        self.setTitleColor(ColorConstants.primaryBlack, for: .normal)
    }
}
/// Primary button
class PrimaryButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    func initialize() {
        self.titleLabel?.font = AppFont.font(with: 14, family: Mulish.bold)
        self.backgroundColor = .blue
        self.tintColor = .red
        self.titleLabel?.textColor = .green
    }
}

/// Primary button
class FavoritesButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.setImage(#imageLiteral(resourceName: "HeartIconInactive"), for: .normal)
        self.setImage(#imageLiteral(resourceName: "HeartIconActive"), for: .selected)
    }
}
class OutlineButton: UIButton {
    override func updateConfiguration() {
        guard let configuration = configuration else {
            return
        }

        // 1
        var updatedConfiguration = configuration

        // 2
        var background = UIButton.Configuration.filled().background

        // 3
        background.cornerRadius = 10
        background.strokeWidth = 1

        // 4
        let strokeColor: UIColor
        let foregroundColor: UIColor
        let backgroundColor: UIColor
        let baseColor = updatedConfiguration.baseForegroundColor ?? UIColor.tintColor

        // ....

        switch self.state {
        case .normal:
            strokeColor = ColorConstants.primaryGray
            foregroundColor = baseColor
            backgroundColor = .clear
        case [.highlighted]:
            strokeColor = .systemGray5
            foregroundColor = baseColor
            backgroundColor = baseColor.withAlphaComponent(0.3)
        case .selected:
            strokeColor = .clear
            foregroundColor = .white
            backgroundColor = baseColor
        case [.selected, .highlighted]:
            strokeColor = .clear
            foregroundColor = .white
            backgroundColor = .red
        case .disabled:
            strokeColor = .systemGray6
            foregroundColor = baseColor.withAlphaComponent(0.3)
            backgroundColor = .clear
        default:
            strokeColor = .systemGray5
            foregroundColor = baseColor
            backgroundColor = .clear
        }

        background.strokeColor = strokeColor
        background.backgroundColor = backgroundColor


        updatedConfiguration.baseForegroundColor = foregroundColor
        updatedConfiguration.background = background
        var container = AttributeContainer()
        container.font = AppFont.font(with: 14, family: Mulish.bold)
        // 1
        updatedConfiguration.attributedTitle = AttributedString(self.titleLabel?.text ?? "", attributes: container)

        // 2
        self.configuration = updatedConfiguration
    }
}
class NormalButton: UIButton {
    override func updateConfiguration() {
        guard let configuration = configuration else {
            return
        }

        // 1
        var updatedConfiguration = configuration

        // 2
        var background = UIButton.Configuration.filled().background

        // 3
        background.cornerRadius = 10
        background.strokeWidth = 0

        // 4
        let strokeColor: UIColor
        let foregroundColor: UIColor
        let backgroundColor: UIColor
        let baseColor = updatedConfiguration.baseForegroundColor ?? UIColor.tintColor

        // ....

        switch self.state {
        case .normal:
            strokeColor = .clear
            foregroundColor = ColorConstants.primaryBlue
            backgroundColor = .clear
        case [.highlighted]:
            strokeColor = .systemGray5
            foregroundColor = baseColor
            backgroundColor = baseColor.withAlphaComponent(0.3)
        case .selected:
            strokeColor = .clear
            foregroundColor = .white
            backgroundColor = baseColor
        case [.selected, .highlighted]:
            strokeColor = .clear
            foregroundColor = .white
            backgroundColor = .red
        case .disabled:
            strokeColor = .systemGray6
            foregroundColor = baseColor.withAlphaComponent(0.3)
            backgroundColor = .clear
        default:
            strokeColor = .systemGray5
            foregroundColor = baseColor
            backgroundColor = .clear
        }

        background.strokeColor = strokeColor
        background.backgroundColor = backgroundColor


        updatedConfiguration.baseForegroundColor = foregroundColor
        updatedConfiguration.background = background
        var container = AttributeContainer()
        container.font = AppFont.font(with: 14, family: Mulish.bold)
        // 1
        updatedConfiguration.attributedTitle = AttributedString(self.titleLabel?.text ?? "", attributes: container)

        // 2
        self.configuration = updatedConfiguration
    }
}
