//
//  UILabel+Custom.swift
//  TingTing
//
//  Created by Aximpro Innovations GmbH on 12/29/20.
//

import UIKit
// swiftlint:disable file_length
// MARK: - Bold UILabels
class XSmallBoldLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
            // initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
        self.font = FontConstants.setDefaultFont(withFont: .bold, withSize: .xsmall)
        self.textColor = ColorConstants.secondary1
        self.updateConstraintsIfNeeded()
    }
}

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
/// UILabel with font title and text color secondaryBlack
class TitleLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
        self.font = FontConstants.title
        self.textColor = ColorConstants.primaryBlue
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

// UILabel with font title and text color secondaryBlack
class CallStatusLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
        self.font = FontConstants.tableSectionHeader
        self.textColor = ColorConstants.primaryBlue
        self.updateConstraintsIfNeeded()
    }
}
/// UILabel with font alertTileBold and text color secondaryBlack
class AlertTitleLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
        self.font = FontConstants.alertTileBold
        self.textColor = ColorConstants.primaryBlue
        self.updateConstraintsIfNeeded()
    }
}
/// UILabel with font alertMessageRegular and text color primaryBlue
class ChooseAContactTableFooterLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
        self.font = FontConstants.chooseAContactFooterRegular
        self.textColor = ColorConstants.primaryBlue
        self.updateConstraintsIfNeeded()
    }
}
/// UILabel with font alertTileBold and text color secondaryBlack
class AlertMessageLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
        self.font = FontConstants.alertButtonLightRegular
        self.textColor = ColorConstants.primaryBlue
        self.updateConstraintsIfNeeded()
    }
}

/// UILabel with font songs and text color secondaryBlack
class SongLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
        self.font = AppFont.font(with: 14, family: Mulish.bold)
        self.textColor = ColorConstants.primaryBlue
        self.updateConstraintsIfNeeded()
    }
}

/// UILabel with font songs and text color secondaryBlack
class HistoryCallTime: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
        self.font = FontConstants.song
        self.textColor = ColorConstants.primaryBlack
        self.updateConstraintsIfNeeded()
    }
}

// UILabel with font contactName and text color secondaryBlack
class ContactNameLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
        self.font = FontConstants.contactName
        self.textColor = ColorConstants.primaryBlue
        self.updateConstraintsIfNeeded()
    }
}

// UILabel with font contactName and text color secondaryBlack
class HistoryContactNameLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
        self.font = FontConstants.contactNumber
        self.textColor = ColorConstants.primaryBlue.withAlphaComponent(0.5)
        self.updateConstraintsIfNeeded()
    }
}

// UILabel with font contactNumber and text color secondaryBlack
class ContactNumberLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
        self.font = FontConstants.contactNumber
        self.textColor = ColorConstants.primaryBlue
        self.updateConstraintsIfNeeded()
    }
}

// UILabel with font CallScreenSongNameLabel and text color white
class CallScreenSongNameLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
        self.font = FontConstants.contactName
        self.textColor = .white
        self.updateConstraintsIfNeeded()
    }
}

// UILabel with font CallScreenSongArtistLabel and text color white
class CallScreenSongArtistLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
        self.font = FontConstants.contactNumber
        self.textColor = .white
        self.updateConstraintsIfNeeded()
    }
}

// UILabel with font CallScreenSongArtistLabel and text color white
class CallRatingText: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
        self.font = FontConstants.callRatingText
        self.textColor = ColorConstants.primaryBlue
        self.updateConstraintsIfNeeded()
    }
}
// UILabel with font SettingMenuLabel and text color white
class SettingMenuLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
        self.font = FontConstants.SettingMenuFont
        self.textColor = ColorConstants.primaryBlue
        self.updateConstraintsIfNeeded()
    }
}
// UILabel with font SettingMenuLabel and text color white
class SettingMenuDeleteLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
        self.font = FontConstants.SettingMenuFont
        self.textColor = ColorConstants.secondayPink
        self.updateConstraintsIfNeeded()
    }
}
// UILabel with font SettingMenuThankYouLabel and text color white
class SettingMenuThankYouLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
        self.font = FontConstants.body
        self.textAlignment = .left
        self.textColor = ColorConstants.primaryBlue
        self.updateConstraintsIfNeeded()
    }
}
// UILabel with font SettingMenuThankYouLabel and text color white
class ChooseASongCollectionViewTitle: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
        self.font = FontConstants.body
        self.textAlignment = .center
        self.textColor = ColorConstants.primaryBlue
        self.updateConstraintsIfNeeded()
    }
}
// UILabel with font SettingMenuThankYouLabel and text color white
class StartTitleLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
        self.font = FontConstants.StartPageTitles
        self.textAlignment = .left
        self.textColor = ColorConstants.primaryBlue
        self.updateConstraintsIfNeeded()
    }
}
// UILabel with font SettingMenuThankYouLabel and text color white
class SongDetailSongNameLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
        self.font = FontConstants.songTitleSongDetail
        self.textAlignment = .left
        self.textColor = ColorConstants.primaryBlue
        self.updateConstraintsIfNeeded()
    }
}
// UILabel with font SettingMenuThankYouLabel and text color white
class HotAndFreshTitle: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
        self.font = FontConstants.privacyButton
        self.textAlignment = .left
        self.textColor = ColorConstants.primaryBlack
        self.updateConstraintsIfNeeded()
    }
}
// UILabel with font HotAndFreshDescription and text color white
class HotAndFreshDescription: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
        self.font = FontConstants.tabItemInActive
        self.textAlignment = .left
        self.textColor = ColorConstants.primaryBlack
        self.updateConstraintsIfNeeded()
    }
}
class MoodsTitleLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
        self.font = FontConstants.contactName
        self.textColor = .white
        self.updateConstraintsIfNeeded()
    }
}

class OccasionTitleLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
        self.font = FontConstants.privacyButton
        self.textColor = .white
        self.updateConstraintsIfNeeded()
    }
}
class PopularTitleLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
        self.font = FontConstants.PopularFont
        self.textColor = .white
        self.updateConstraintsIfNeeded()
    }
}
