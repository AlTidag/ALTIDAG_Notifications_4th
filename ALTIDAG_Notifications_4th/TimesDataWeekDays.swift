//
//  TimesDataWeekDays.swift
//  ALTIDAG_Notifications_1st
//
//  Created by Itzhak Duani on 09/06/2022.
//

import Foundation

// MARK: - TimesData
struct TimesDataWeekDays: Codable {
    let date: String
    let times: Times
}

// MARK: - Times
struct Times: Codable {
    let chatzotNight, alotHaShachar, misheyakir, misheyakirMachmir: String
    let dawn, sunrise, sofZmanShma, sofZmanShmaMGA: String
    let sofZmanTfilla, sofZmanTfillaMGA, chatzot, minchaGedola: String
    let minchaKetana, plagHaMincha, sunset, dusk: String
    let tzeit7083Deg, tzeit85Deg, tzeit42Min, tzeit50Min: String
    let tzeit72Min: String
    let candleLightTitle, candleLightTime, porshen, titleOfShabat, havdalah, havdalahDate: String?

    enum CodingKeys: String, CodingKey {
        case chatzotNight, alotHaShachar, misheyakir, misheyakirMachmir, dawn, sunrise, sofZmanShma, sofZmanShmaMGA, sofZmanTfilla, sofZmanTfillaMGA, chatzot, minchaGedola, minchaKetana, plagHaMincha, sunset, dusk, candleLightTitle, candleLightTime, porshen, titleOfShabat, havdalah, havdalahDate
        case tzeit7083Deg = "tzeit7083deg"
        case tzeit85Deg = "tzeit85deg"
        case tzeit42Min = "tzeit42min"
        case tzeit50Min = "tzeit50min"
        case tzeit72Min = "tzeit72min"
    }
}


