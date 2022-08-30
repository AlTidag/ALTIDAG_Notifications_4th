//
//  TimeModelData.swift
//  ALTIDAG_Notifications_2nd
//
//  Created by Itzhak Duani on 05/07/2022.
//

import Foundation

func createTimeForNotification(date: Date, notificationTime: Int) -> Date {
    let modifiedDate = Calendar.current.date(byAdding: .second, value: notificationTime, to: date)!
    return modifiedDate
}

func  getCurrentTime() -> String {
 
     let date = Date()
     let calendar = Calendar.current
     
     let year = calendar.component(.year, from: date)
     let month = calendar.component(.month, from: date)
     let day = calendar.component(.day, from: date)
     let hour = calendar.component(.hour, from: date)
     let minutes = calendar.component(.minute, from: date)
     let seconds = calendar.component(.second, from: date)
 
     let realTime = "\(year)-\(month)-\(day)-\(hour)-\(minutes)-\(seconds)"
 
     return realTime
 }

func dateFormatterToString(date: Date) -> String {
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
    let result = dateFormatter.string(from: date)
    return result
}

func dateFormatDate(date: String) -> Date {
let dateDefault = Date()
let formatter = DateFormatter()
formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
    let dateAsDate = formatter.date(from: date)
    return dateAsDate ?? dateDefault
    
}

func secondsFromTwoDates(fromDate: Date, toDate: Date) -> Int{
let formatter = DateFormatter()
formatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
//let xmas = formatter.date(from: fromDate)
//let newYear = formatter.date(from: toDate)
    let diffSeconds = fromDate.timeIntervalSinceReferenceDate - toDate.timeIntervalSinceReferenceDate
print("🎀🎀🎀", diffSeconds)
    return Int(diffSeconds)
}

//Creating new date string by adding or subtracting time
func addingDaysToDate(day: Int, date: Date) -> Date {
    let distantDate =  Calendar.current.date(byAdding: .day, value: day, to: date)!
    return distantDate
    }

func addingSeconds(seconds: Int, date: Date) -> Date {
    return Calendar.current.date(byAdding: .second, value: seconds, to: date)!
}

extension DateComponents {
   static func triggerFor(hour: Int, minute: Int) -> DateComponents {
      var component = DateComponents()
      component.calendar = Calendar.current
      component.hour = hour
      component.minute = minute
      component.weekday = 1
      return component
   }
}

extension Date {
    func dayNumberOfWeek() -> Int? {
        let dateIs = Calendar.current.dateComponents([.weekday], from: self).weekday
        print(dateIs)
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
}

 
