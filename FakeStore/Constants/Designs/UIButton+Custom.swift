//
//  UIButton+Custom.swift
//  TingTing
//
//  Created by Aximpro Innovations GmbH on 12/29/20.
//

import UIKit
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
