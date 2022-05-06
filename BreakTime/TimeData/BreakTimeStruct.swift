//
//  BreakTimeStruct.swift
//  BreakTime
//
//  Created by Jaehwa Noh on 2022/05/03.
//

import Foundation

struct BreakTime {
    var startHour: Int
    var startMinute: Int
    var isEdited: Bool
    
    var isTurnOn: Bool {
        willSet {
            print("changed \(self.isTurnOn), \(newValue)")
        }
    }
    var durationMinute: Int
    
    var memo: String
    
    init() {
        self.startHour = {
            let date = Date()
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: date)
            return hour
        }()
        self.startMinute = {
            let date = Date()
            let calendar = Calendar.current
            let minute = calendar.component(.minute, from: date)
            return minute
        }()
        
//        self.startMinute = 8
        self.isEdited = false
        self.isTurnOn = false
        self.durationMinute = 10
        self.memo = "puadsfdsfdlsfjl;adsfjl;dajsl;jfl;sajl;fajl;fjldajfajdlsfjl;adjsfljadsfjl;dasf;a\n테스트"
        
        print(self.startHour, self.startMinute, self.isTurnOn, self.durationMinute, self.memo)
    }
    
    
    mutating func changeHourAndMinute(newTimeHour: Int, newTimeMinute: Int) {
        startHour = newTimeHour
        startMinute = newTimeMinute
    }
    
    mutating func changeDurationTime(newDuration: Int) {
        durationMinute = newDuration
    }
    
    mutating func changeMemo(newMemo: String) {
        self.memo = newMemo
    }
}
