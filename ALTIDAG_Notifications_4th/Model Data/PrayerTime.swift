//
//  PrayerTime.swift
//  ALTIDAG_Notifications_2nd
//
//  Created by Itzhak Duani on 05/07/2022.
//

import Foundation
// Take care of the Labels of the custom cell, the time that was choosen and the button if Off or On
class PrayerTime {
    var name: String
    var time: Double
    var isOn: Bool
    init(name: String, time: Double, isOn: Bool) {
        self.name = name
        self.time = time
        self.isOn = isOn
    }
}

 let weekPrayerTimes = [PrayerTime(name: "Candle lighting", time: 0.0, isOn: false),
                        PrayerTime(name: "Havdala", time: 0.0, isOn: false)]


//PrayerTime(name: "Dawn (Alot hashahar)", time: 0.0, isOn: false),
//                       PrayerTime(name: "Sunrise", time: 0.0, isOn: false),
//                       PrayerTime(name: "Midday (Hatzot hayom)", time: 0.0, isOn: false),
//                       PrayerTime(name: "Sunset", time: 0.0, isOn: false),
