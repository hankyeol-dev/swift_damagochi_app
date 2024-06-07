//
//  Extension-IdentifierProtocol.swift
//  damagochi
//
//  Created by 강한결 on 6/7/24.
//

import Foundation
import UIKit

protocol SetIdentifier {
    static var identifier: String { get }
}

extension UIViewController: SetIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableView: SetIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: SetIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionView: SetIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: SetIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}
