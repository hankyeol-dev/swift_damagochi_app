//
//  Helper-UserDefaults.swift
//  damagochi
//
//  Created by 강한결 on 6/7/24.
//

import Foundation

enum FeedType {
    case leaf
    case drop
}

struct UserDefaultsHelper {
    
    static private func saveData(_ data: User) {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(data) {
            UserDefaults.standard.setValue(data, forKey: "user")
        }
    }
    
    static private func isSavedUser() -> Bool {
        guard UserDefaults.standard.object(forKey: "user") != nil else { return false }
        return true
    }
    
    static func getUserData() -> User {
        return try! JSONDecoder().decode(User.self, from: UserDefaults.standard.object(forKey: "user") as! Data)
    }
    
    static func findOrSaveUserData(damagochies: [Damagochi]) -> User {
        if !UserDefaultsHelper.isSavedUser() {
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
    
    static func getDamagochiById(_ damagochiId: Int) -> Damagochi {
        return UserDefaultsHelper.getUserData().damagochies.filter {
            return $0.id == damagochiId
        }[0]
    }
    
    static func selectDamagochiById(_ damagochiId: Int) {
        var userData = UserDefaultsHelper.getUserData()
        var damagochies = userData.damagochies
        
        for i in 0..<damagochies.count {
            if damagochies[i].id == damagochiId {
                damagochies[i].isSelected = true
                break;
            }
        }
        
        userData.damagochies = damagochies
        
        UserDefaultsHelper.saveData(userData);
    }
    
    static func isSelectedDamagochi() -> Int {
        let selectedDamagochi = UserDefaultsHelper.getUserData().damagochies.filter {
            return $0.isSelected == true
        }
        return selectedDamagochi.count == 0 ? -1 : selectedDamagochi[0].id
    }
    
    static func diSelectDamagochiById(_ damagochiId: Int) {
        var userData = UserDefaultsHelper.getUserData()
        var damagochies = userData.damagochies
        
        for i in 0..<damagochies.count {
            if damagochies[i].id == damagochiId {
                damagochies[i].isSelected = false
                break;
            }
        }
        
        userData.damagochies = damagochies
        
        UserDefaultsHelper.saveData(userData);
    }
    
    static func updateDamagochiByFeed(_ damagochiId: Int, type: FeedType, amount: Int) {
        // 1. leaf or water 구분하기
        // 2. 해당 항목을 기존 값에 더 해준다. 
        // 3. lv를 계산한다.
        // 4. 계산된 lv을 기존 lv에 더해준다.
        // 5. User 데이터를 업데이트하여 저장한다.
        // 6. 이벤트를 넘긴 함수에서 view를 고친다.
        
        var userData = UserDefaultsHelper.getUserData()
        var damagochies = userData.damagochies
        
        for i in 0..<damagochies.count {
            if damagochies[i].id == damagochiId {
                
                if type == .leaf {
                    damagochies[i].leaf += amount
                } else {
                    damagochies[i].drop += amount
                }
                
                damagochies[i].lv = damagochies[i].calcLV
                
                break
            }
        }
        
        userData.damagochies = damagochies
        
        UserDefaultsHelper.saveData(userData);
    }
}

