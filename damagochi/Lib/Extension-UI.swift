//
//  UI_Extension.swift
//  damagochi
//
//  Created by 강한결 on 6/7/24.
//

import Foundation
import UIKit

extension UIColor {
    static let _appBackGroundColor = UIColor(red: 244/255, green: 252/255, blue: 252/255, alpha: 1)
    static let _appSystemFontColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
}

extension UIFont {
    static let _appSystemFontS = UIFont.systemFont(ofSize: 13)
    static let _appSystemFontM = UIFont.systemFont(ofSize: 14)
    static let _appSystemFontL = UIFont.systemFont(ofSize: 15)
    
    static let _appSystemBoldFontS = UIFont.boldSystemFont(ofSize: 13)
    static let _appSystemBoldFontM = UIFont.boldSystemFont(ofSize: 14)
    static let _appSystemBoldFontL = UIFont.boldSystemFont(ofSize: 15)
}
    
extension UIButton {
    func _setEatingButton(_ title: String) {
        self.tintColor = UIColor._appSystemFontColor
        self.setTitle(title, for: .normal)
        self.setTitleColor(UIColor._appSystemFontColor, for: .normal)
        self.setImage(UIImage(systemName: Icons.eatLeaf.rawValue), for: .normal)
        self.titleLabel?.font = UIFont._appSystemFontS
        self.backgroundColor = UIColor._appBackGroundColor
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor._appSystemFontColor.cgColor
    }
}

extension UITextField {
    func _setEatingField(_ placeholder: String) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
        self.placeholder = placeholder
        self.keyboardType = .numberPad
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor._appSystemFontColor.cgColor
        self.layer.cornerRadius = 8
        self.font = UIFont._appSystemFontS        
    }
}
