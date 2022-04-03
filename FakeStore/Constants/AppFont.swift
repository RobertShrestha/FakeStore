//
//  AppFont.swift
//  Halo
//
//  Created by ebpearls on 2/2/21.
//

import UIKit

typealias AppFont = UIFont

extension AppFont {
    static func font(with size: CGFloat, family: FontFamily?) -> AppFont {
        guard let family = family, let requiredFont = UIFont(name: family.value, size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return requiredFont
    }
}

protocol FontFamily {
    var value: String { get }
}

enum Mulish: FontFamily {
    case bold
    case semiBold
    case regular
    case extraBold
    
    var value: String {
        switch self {
        case .bold: return "Mulish-Bold"
        case .semiBold: return "Mulish-SemiBold"
        case .regular: return "Mulish-Regular"
        case .extraBold: return "Mulish-ExtraBold"
        }
    }
}
