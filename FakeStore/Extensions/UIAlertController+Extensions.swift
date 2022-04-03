//
//  UIAlertController+Extensions.swift
//  TingTing
//
//  Created by Aximpro Innovations GmbH on 12/29/20.
//

import UIKit

extension UIAlertController {
    func addAction(title: String?, style: UIAlertAction.Style = .default, handler: (() -> Void)? = nil) {
        let action = UIAlertAction(title: title, style: style, handler: {_ in
            handler?()
        })
        self.addAction(action)
    }
}
