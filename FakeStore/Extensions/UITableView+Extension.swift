//
//  UITableView+Extension.swift
//  TingTing
//
//  Created by Aximpro Innovations GmbH on 12/29/20.
//
import UIKit
// Useful link
// https://alisoftware.github.io/swift/generics/2016/01/06/generic-tableviewcells/
//https://medium.com/over-engineering/an-easier-way-to-dequeue-cells-in-ios-5c8b8de4dfed

// MARK: - UITableview Extensions
// swiftlint:disable force_cast
let fileTypeNib = "nib"

extension NSObject {
    static func fileExists(at path: String) -> Bool {
        return FileManager.default.fileExists(atPath: path)
    }
}

extension UINib {
    static func nibExists(nibName: String) -> Bool {
        guard let path = Bundle.main.path(forResource: nibName, ofType: fileTypeNib) else {
            return false
        }
        return fileExists(at: path)
    }
}

protocol Reusable: AnyObject {
    static var reuseIdentifier: String { get }
    static var nib: UINib? { get }
}

extension Reusable {
    static var reuseIdentifier: String { return String(describing: Self.self) }
    static var nib: UINib? {
        if UINib.nibExists(nibName: reuseIdentifier) {
            return UINib(nibName: reuseIdentifier, bundle: nil)
        } else {
            return nil
        }
    }
}

extension UITableView {
    func registerReusableCell<T: UITableViewCell>(_: T.Type) where T: Reusable {
        if let nib = T.nib {
            self.register(nib, forCellReuseIdentifier: T.reuseIdentifier)
        } else {
            self.register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
        }
    }
    func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T where T: Reusable {
        return self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
    func registerReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_: T.Type) where T: Reusable {
        if let nib = T.nib {
            self.register(nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
        } else {
            self.register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
        }
    }
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T where T: Reusable {
        return self.dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as! T
    }
}

extension UICollectionView {
    func registerReusableCell<T: UICollectionViewCell>(_: T.Type) where T: Reusable {
        if let nib = T.nib {
            self.register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
        } else {
            self.register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
        }
    }
    func dequeueReusableCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T where T: Reusable {
        return self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
    func registerReusableSupplementaryView<T: Reusable>(elementKind: String, _: T.Type) {
        if let nib = T.nib {
            self.register(nib, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: T.reuseIdentifier)
        } else {
            self.register(T.self, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: T.reuseIdentifier)
        }
    }
    func dequeueReusableSupplementaryView<T: UICollectionViewCell>(elementKind: String,
                                                                   indexPath: IndexPath) -> T where T: Reusable {
        return self.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: T.reuseIdentifier,
                                                     for: indexPath) as! T
    }
}
// MARK: - Handle Empty TableView
extension UITableView {
    func setEmptyView(title: String, message: String, messageImage: UIImage) {
        let emptyView = UIView(frame: CGRect(x: self.center.x,
                                             y: self.center.y,
                                             width: self.bounds.size.width,
                                             height: self.bounds.size.height))
        let messageImageView = UIImageView()
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        messageImageView.backgroundColor = .clear
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageImageView.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor.black
        titleLabel.font = FontConstants.setDefaultFont(withFont: .bold, withSize: .small)
        titleLabel.textColor = ColorConstants.secondary1
        messageLabel.textColor = UIColor.lightGray
        messageLabel.font = FontConstants.setDefaultFont(withFont: .regular, withSize: .large)
        messageLabel.textColor = ColorConstants.secondary2
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageImageView)
        emptyView.addSubview(messageLabel)
        messageImageView.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        messageImageView.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor, constant: 0).isActive = true
        messageImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        messageImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: messageImageView.topAnchor, constant: -10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        messageLabel.topAnchor.constraint(equalTo: messageImageView.bottomAnchor, constant: 10).isActive = true
        messageLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: 10).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 10).isActive = true
        messageImageView.image = messageImage
        titleLabel.text = title
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
    func setEmptyViewContactView(title: String,
                                 message: String,
                                 buttonTitle: String,
                                 buttonTapped: (() -> Void)? = nil) {
        let emptyView = UIView(frame: CGRect(x: self.center.x,
                                             y: self.center.y,
                                             width: self.bounds.size.width,
                                             height: self.bounds.size.height))
        let titleLabel = HeaderLabel()
        let messageLabel = SongLabel()
        let button = PrimaryButton()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = title
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        messageLabel.text = message
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        if buttonTapped != nil {
            button.addAction(action: buttonTapped!)
        }
        button.setTitle(buttonTitle, for: .normal)
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageLabel)
        emptyView.addSubview(button)
        button.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 40).isActive = true
        button.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -40).isActive = true
        messageLabel.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -40).isActive = true
        messageLabel.widthAnchor.constraint(equalTo: button.widthAnchor, constant: 0).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: messageLabel.centerXAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -10).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 10).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -10).isActive = true
        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
    func setEmptyViewChooseAContact(firstButtonTitle: String,
                                    secondButtonTitle: String,
                                    message: String,
                                    title: String,
                                    firstButtonTapped: (() -> Void)? = nil,
                                    secondButtonTapped: (() -> Void)? = nil) {
        let emptyView = UIView(frame: CGRect(x: self.center.x,
                                             y: self.center.y,
                                             width: self.bounds.size.width,
                                             height: self.bounds.size.height))
        let titleLabel = HeaderLabel()
        let messageLabel = SongLabel()
        let firstButton = PrimaryButton()
        let secondButton = PrimaryButton()
        let orLabel = HeaderLabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        messageLabel.text = message
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        orLabel.text = Constants.orLabel
        orLabel.textAlignment = .center
        if firstButtonTapped != nil {
            firstButton.addAction(action: firstButtonTapped!)
        }
        if secondButtonTapped != nil {
            secondButton.addAction(action: secondButtonTapped!)
        }
        firstButton.setTitle(firstButtonTitle, for: .normal)
        secondButton.setTitle(secondButtonTitle, for: .normal)
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageLabel)
        emptyView.addSubview(firstButton)
        emptyView.addSubview(secondButton)
        emptyView.addSubview(orLabel)
//        if !UserDefaultsConstants.previewShareVisibility {
//            orLabel.isHidden = true
//            secondButton.isHidden = true
//        }
        firstButton.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        firstButton.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor, constant: -80).isActive = true
        firstButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        firstButton.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 40).isActive = true
        firstButton.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -40).isActive = true
        messageLabel.centerXAnchor.constraint(equalTo: firstButton.centerXAnchor).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: firstButton.topAnchor, constant: -40).isActive = true
        messageLabel.widthAnchor.constraint(equalTo: firstButton.widthAnchor, constant: 0).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: messageLabel.centerXAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -10).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 10).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -10).isActive = true
        orLabel.centerXAnchor.constraint(equalTo: firstButton.centerXAnchor).isActive = true
        orLabel.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 10).isActive = true
        orLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        orLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 40).isActive = true
        orLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -40).isActive = true
        secondButton.centerXAnchor.constraint(equalTo: firstButton.centerXAnchor).isActive = true
        secondButton.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 10).isActive = true
        secondButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        secondButton.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 40).isActive = true
        secondButton.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -40).isActive = true
        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
    func setEmptySearchViewContactView(title: String,
                                       message: String) {
        let emptyView = UIView(frame: CGRect(x: self.center.x,
                                             y: self.center.y,
                                             width: self.bounds.size.width,
                                             height: self.bounds.size.height))
        let titleLabel = HeaderLabel()
        let messageLabel = SongLabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = title
        messageLabel.text = message
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageLabel)
        messageLabel.isHidden = true
        messageLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        messageLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: messageLabel.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: emptyView.topAnchor, constant: 20).isActive = true
        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
    func setEmptySearchViewPlaylist(title: String,
                                    message: String) {
        let emptyView = UIView(frame: CGRect(x: self.center.x,
                                             y: self.center.y,
                                             width: self.bounds.size.width,
                                             height: self.bounds.size.height))
        let titleLabel = HeaderLabel()
        let messageLabel = SongLabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = title
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        messageLabel.text = message
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageLabel)
        messageLabel.isHidden = true
        messageLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        messageLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 10).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: messageLabel.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: emptyView.topAnchor, constant: 150).isActive = true
        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
    func setEmptyStartSearchView(title: String,
                                 message: String,
                                 buttonTitle: String,
                                 buttonTapped: (() -> Void)? = nil) {
        let emptyView = UIView(frame: CGRect(x: self.center.x,
                                             y: self.center.y,
                                             width: self.bounds.size.width,
                                             height: self.bounds.size.height))
        let titleLabel = HeaderLabel()
        let messageLabel = SongLabel()
        let button = PrimaryButton()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = title
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        messageLabel.text = message
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageLabel)
        emptyView.addSubview(button)
        if buttonTapped != nil {
            button.addAction(action: buttonTapped!)
        }
        button.setTitle(buttonTitle, for: .normal)
        messageLabel.isHidden = true
        messageLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        messageLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 10).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: messageLabel.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: emptyView.topAnchor, constant: 150).isActive = true
        button.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50).isActive = true
        button.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 40).isActive = true
        button.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -40).isActive = true
        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
    func restore() {
        DispatchQueue.main.async {
            self.backgroundView = nil
            self.separatorStyle = .singleLine
        }
    }
}
extension UICollectionView {
    func setEmptyView(title: String, message: String) {
        let emptyView = UIView(frame: CGRect(x: self.center.x,
                                             y: self.center.y,
                                             width: self.bounds.size.width,
                                             height: self.bounds.size.height))
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        messageLabel.textColor = UIColor.lightGray
        messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageLabel)
        titleLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 20).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -20).isActive = true
        titleLabel.text = title
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        // The only tricky part is here:
        self.backgroundView = emptyView
    }
    func restore() {
        self.backgroundView = nil
    }
}
extension UITableView {
  func hasRowAtIndexPath(indexPath: IndexPath) -> Bool {
    return indexPath.section < self.numberOfSections && indexPath.row < self.numberOfRows(inSection: indexPath.section)
  }

  func scrollToTop(animated: Bool) {
    let indexPath = IndexPath(row: 0, section: 0)
    if self.hasRowAtIndexPath(indexPath: indexPath) {
      self.scrollToRow(at: indexPath, at: .top, animated: animated)
    }
  }
}
