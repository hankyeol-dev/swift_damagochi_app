//
//  Setting.swift
//  damagochi
//
//  Created by 강한결 on 6/8/24.
//

import Foundation
import UIKit

struct SettingItem {
    let image: SettingIcons.RawValue
    let title: String
    let isNameSettingCell: Bool
}

let SettingList: [SettingItem] = [
    SettingItem(image: SettingIcons.pencil.rawValue, title: "내 이름 설정하기", isNameSettingCell: true),
    SettingItem(image: SettingIcons.moon.rawValue, title: "다마고치 변경하기", isNameSettingCell: false),
    SettingItem(image: SettingIcons.arrow.rawValue, title: "데이터 초기화", isNameSettingCell: false)
]
