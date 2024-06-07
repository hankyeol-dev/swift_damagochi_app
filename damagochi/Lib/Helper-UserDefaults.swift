//
//  Helper-UserDefaults.swift
//  damagochi
//
//  Created by 강한결 on 6/7/24.
//

import Foundation

func saveData<T: Codable>(data: T, forKey: String){
    let encoder = JSONEncoder()
    if let data = try? encoder.encode(data) {
        UserDefaults.standard.setValue(data, forKey: forKey)
    }
}

func findData(forKey: String) -> Bool {
    guard let data = UserDefaults.standard.object(forKey: forKey) else {
        return false
    }
    
    return true
}
