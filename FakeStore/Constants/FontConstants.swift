//
//  FontConstants.swift
//  TingTing
//
//  Created by Aximpro Innovations GmbH on 12/29/20.
//

import UIKit
struct FontConstants {
    static func setDefaultFont(withFont fontName: FontNames.Roboto, withSize size: FontSize) -> UIFont {
        return UIFont(name: fontName.rawValue, size: size.rawValue)!
    }
    /// Font Bold Ubuntu size 30
    static let title: UIFont = {
        return UIFont(name: FontNames.Ubuntu.bold.value, size: FontSize.xLarge.rawValue)!
    }()
    /// Font Bold Ubuntu size 20
    static let header: UIFont = {
        return UIFont(name: FontNames.Ubuntu.bold.value, size: FontSize.large.rawValue)!
    }()
    /// Font Bold Ubuntu size 16
    static let tableSectionHeader: UIFont = {
        return UIFont(name: FontNames.Ubuntu.bold.value, size: FontSize.lmedium.rawValue)!
    }()

    /// Font Medium Ubuntu size 14
    static let textFieldText: UIFont = {
        return UIFont(name: FontNames.Ubuntu.medium.value, size: FontSize.medium.rawValue)!
    }()
    /// Font Medium Ubuntu size 14
    static let segementControlSelected: UIFont = {
        return UIFont(name: FontNames.Roboto.bold.value, size: FontSize.small.rawValue)!
    }()
    /// Font Medium Ubuntu size 14
    static let segementControlUnSelected: UIFont = {
        return UIFont(name: FontNames.Roboto.regular.value, size: FontSize.small.rawValue)!
    }()
    /// Font Medium Ubuntu size 18
    static let callRatingText: UIFont = {
        return UIFont(name: FontNames.Ubuntu.medium.value, size: FontSize.llmedium.rawValue)!
    }()

    /// Font Bold Ubuntu size 13
    static let subHeader: UIFont = {
        return UIFont(name: FontNames.Ubuntu.bold.value, size: FontSize.small.rawValue)!
    }()
    /// Font Bold Ubuntu size 14
    static let button: UIFont = {
        return UIFont(name: FontNames.Ubuntu.bold.value, size: FontSize.medium.rawValue)!
    }()
    /// Font Bold Ubuntu size 14
    static let smallButton: UIFont = {
        return UIFont(name: FontNames.Ubuntu.bold.value, size: FontSize.lmedium.rawValue)!
    }()
    /// Font Italic Roboto size 20
    static let quote: UIFont = {
        return UIFont(name: FontNames.Roboto.italic.value, size: FontSize.large.rawValue)!
    }()
    /// Font Bold Roboto size 14
    static let largeBody: UIFont = {
        return UIFont(name: FontNames.Roboto.bold.value, size: FontSize.medium.rawValue)!
    }()
    /// Font Bold Roboto size 10
    static let tabItemActive: UIFont = {
        return UIFont(name: FontNames.Roboto.bold.value, size: FontSize.xxsmall.rawValue)!
    }()
    /// Font Regular Roboto size 10
    static let tabItemInActive: UIFont = {
        return UIFont(name: FontNames.Roboto.regular.value, size: FontSize.xxsmall.rawValue)!
    }()
    /// Font Regular Roboto size 14
    static let body: UIFont = {
        return UIFont(name: FontNames.Roboto.regular.value, size: FontSize.medium.rawValue)!
    }()
    /// Font Regular Roboto size 12
    static let song: UIFont = {
        return UIFont(name: FontNames.Roboto.regular.value, size: FontSize.xsmall.rawValue)!
    }()
    /// Font Bold Roboto 12
    static let privacyButton: UIFont = {
        return UIFont(name: FontNames.Roboto.bold.value, size: FontSize.xsmall.rawValue)!
    }()
    /// Font Bold Roboto size 13
    static let contactName: UIFont = {
        return UIFont(name: FontNames.Roboto.bold.value, size: FontSize.small.rawValue)!
    }()
    /// Font Bold Roboto size 20
    static let PopularFont: UIFont = {
        return UIFont(name: FontNames.Roboto.bold.value, size: FontSize.large.rawValue)!
    }()
    /// Font Regular Roboto size 13
    static let contactNumber: UIFont = {
        return UIFont(name: FontNames.Roboto.regular.value, size: FontSize.small.rawValue)!
    }()
    /// Font Regular Roboto size 20
    static let SettingMenuFont: UIFont = {
        return UIFont(name: FontNames.Roboto.regular.value, size: FontSize.large.rawValue)!
    }()
    /// Font Bold Roboto size 16
    static let StartPageTitles: UIFont = {
        return UIFont(name: FontNames.Roboto.bold.value, size: FontSize.lmedium.rawValue)!
    }()
    /// Font Bold Ubuntu size 17
    static let alertTileBold: UIFont = {
        return UIFont(name: FontNames.Ubuntu.bold.value, size: FontSize.lmedium.rawValue)!
    }()
    /// Font Regular Ubuntu size 17
    static let alertTitleRegularBold: UIFont = {
        return UIFont(name: FontNames.Ubuntu.regular.value, size: FontSize.small.rawValue)!
    }()
    /// Font Regular Ubuntu size 13
    static let alertMessageRegular: UIFont = {
        return UIFont(name: FontNames.Ubuntu.regular.value, size: FontSize.small.rawValue)!
    }()
    /// Font Regular Ubuntu size 14
    static let chooseAContactFooterRegular: UIFont = {
        return UIFont(name: FontNames.Ubuntu.regular.value, size: FontSize.medium.rawValue)!
    }()
    /// Font light Ubuntu size 13
    static let alertButtonLightRegular: UIFont = {
        return UIFont(name: FontNames.Ubuntu.light.value, size: FontSize.lmedium.rawValue)!
    }()
    /// Font light Ubuntu size 13
    static let songTitleSongDetail: UIFont = {
        return UIFont(name: FontNames.Roboto.medium.value, size: FontSize.llmedium.rawValue)!
    }()
}
struct FontNames {
    enum Roboto: String {
        case bold = "Roboto-Bold"
        case regular = "Roboto-Regular"
        case light = "Roboto-Light"
        case thin = "Roboto-Thin"
        case medium = "Roboto-Medium"
        case italic = "Roboto-Italic"
        var value: String {
            return self.rawValue
        }
    }
    enum Ubuntu: String {
        case bold = "Ubuntu-Bold"
        case regular = "Ubuntu-Regular"
        case light = "Ubuntu-Light"
        case italic = "Ubuntu-Italic"
        case medium = "Ubuntu-Medium"
        var value: String {
            return self.rawValue
        }
    }
}
/// Font sizes
enum FontSize: CGFloat {
    case xxsmall = 10
    case xsmall = 12
    case small = 13
    case medium = 14
    case lmedium = 16
    case llmedium = 18
    case large = 20
    case xLarge = 30
}
