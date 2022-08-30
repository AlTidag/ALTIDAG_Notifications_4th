//
//  TimesData.swift
//  ALTIDAG_Notifications_1st
//
//  Created by Itzhak Duani on 07/06/2022.
//



// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let timesData = try? newJSONDecoder().decode(TimesData.self, from: jsonData)

import Foundation

// MARK: - TimesData
struct TimesDataShabat: Codable {
    let title, date: String
    let range: Range
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let title, date, category: String
    let titleOrig: String?
    let hebrew: String
    let memo: String?
    

    enum CodingKeys: String, CodingKey {
        case title, date, category
        case titleOrig = "title_orig"
        case hebrew, memo
    }
}

// MARK: - Range
struct Range: Codable {
    let start, end: String
}
