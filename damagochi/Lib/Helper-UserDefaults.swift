//
//  Helper-UserDefaults.swift
//  damagochi
//
//  Created by 강한결 on 6/7/24.
//

import Foundation

struct UserDefaultsHelper {
    
    static private func saveData(_ data: User) {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(data) {
            UserDefaults.standard.setValue(data, forKey: "user")
        }
    }
    
    static private func isSavedUser() -> Bool {
        guard let data = UserDefaults.standard.object(forKey: "user") else { return false }
        return true
    }
    
    static func getUserData() -> User {
        return try! JSONDecoder().decode(User.self, from: UserDefaults.standard.object(forKey: "user") as! Data)
    }
    
    static func findOrSaveUserData(damagochies: [Damagochi]) -> User {
        if !UserDefaultsHelper.isSavedUser() {
            // 반환하기
            self.saveData(User(damagochies: damagochies))
        }
        return UserDefaultsHelper.getUserData()
    }
    
    static func updateUserName(_ updateName: String) {
        var userData = UserDefaultsHelper.getUserData()
        
        userData.name = updateName
        
        UserDefaultsHelper.saveData(userData)
    }
    
    static func getUserName() -> String {
        return UserDefaultsHelper.getUserData().name
    }
    
    static func resetUserData() {
        let newUser = User(damagochies: generateDamagochis())
        self.saveData(newUser)
    }
}

