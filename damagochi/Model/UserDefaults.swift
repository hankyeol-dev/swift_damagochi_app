//
//  UserDefaults.swift
//  damagochi
//
//  Created by 강한결 on 6/7/24.
//

import Foundation
import UIKit

struct User: Codable {
    var name: String = "대장"
    let damagochies: [Damagochi]
}

struct Damagochi: Codable {
    let id: Int
    let name: String
    let descript: String
    var isOpened: Bool
    var lv: Int = 1
    var leaf: Int = 0
    var drop: Int = 0
    
    var calcLV: Int {
        return calcLevel(leaf: self.leaf, drop: self.drop)
    }
    
    var getDamagochiImage: String {
        return isOpened ? lv == 10 ? "\(id)" + "-9" : "\(id)" + Constants.damagochiState[lv - 1] : "noImage"
    }
    
    private func calcLevel(leaf: Int, drop: Int) -> Int {
        
        let calc = Int((leaf / 5) + (drop / 2)) / 10
        
        return calc >= 10 ? 10 : calc < 2 ? 1 : calc
    }
}

