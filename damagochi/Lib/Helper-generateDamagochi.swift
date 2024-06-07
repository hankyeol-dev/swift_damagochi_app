//
//  Helper-generateDamagochi.swift
//  damagochi
//
//  Created by 강한결 on 6/7/24.
//

import Foundation

func generateDamagochis() -> [Damagochi] {
    let base = [
        ["따끔따끔 다마고치", "저는 따끔따끔 다마고치입니당 키는 100km\n 몸무게는 150톤이에용\n 성격은 화끈하고 날라다닙니당~!\n 열심히 잘 먹고 잘 클 자신은\n 있답니당 방실방실!"],
        ["방실방실 다마고치", "저는 방실방실 다마고치입니당 키는 100km\n 몸무게는 150톤이에용\n 성격은 화끈하고 날라다닙니당~!\n 열심히 잘 먹고 잘 클 자신은\n 있답니당 방실방실!"],
        ["반짝반짝 다마고치", "저는 방실방실 다마고치입니당 키는 100km\n 몸무게는 150톤이에용\n 성격은 화끈하고 날라다닙니당~!\n 열심히 잘 먹고 잘 클 자신은\n 있답니당 방실방실!"]
    ]
    
    return Array(0...19).enumerated().map { (idx, el) in
        if idx < 3 {
            return Damagochi(id: idx + 1, name: base[idx][0], descript: base[idx][1], isOpened: true)
        } else {
            return Damagochi(id: idx + 1, name: "준비중입니다.", descript: "", isOpened: false)
        }
    }
}
