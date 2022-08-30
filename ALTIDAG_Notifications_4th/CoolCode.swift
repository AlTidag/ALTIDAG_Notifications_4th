//
//  CoolCode.swift
//  ALTIDAG_Notifications_2nd
//
//  Created by Itzhak Duani on 07/07/2022.
//




//get current time of hebrew gregorian and jappanis calendars

//var gregorianCalendar = Calendar(identifier: .gregorian)
//var japaneseCalendar = Calendar(identifier: .japanese)
//var hebrewCalendar = Calendar(identifier: .hebrew)
//
//func currentDate(for calendar: Calendar) -> DateComponents {
//    calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date())
//}
//
//print("Gregorian", currentDate(for: gregorianCalendar))
//print("Japanese", currentDate(for: japaneseCalendar))
//print("Hebrew", currentDate(for: hebrewCalendar))






// to use inside old schedule button
//let date = Date()
////        Adding or subtracting time from +0000 current date of the location
//let destinationDate = addingSeconds(seconds: newOffsetTimeZones, date: date)
////        Adding or subtracting time from +0000 date
////        let destinationSunrise = addingSeconds(seconds: newOffsetTimeZones, date: sunriseDate!)
////        let destinationDawn = addingSeconds(seconds: newOffsetTimeZones, date: dawnDate!)
////        let destinationChatzot = addingSeconds(seconds: newOffsetTimeZones, date: chatzotDate!)
////        let destinationSunset = addingSeconds(seconds: newOffsetTimeZones, date: sunriseDate!)
//let destinationCandleLighting = addingSeconds(seconds: newOffsetTimeZones, date: candleLightinDate!)
//let destinationHavdala = addingSeconds(seconds: newOffsetTimeZones, date: havdalaDate!)
//
////        Finding the diffrence in time betwin 2 dates
////        let secondsFromSunrise = secondsFromTwoDates(fromDate: destinationSunrise, toDate: destinationDate)
////        let secondsFromDawn = secondsFromTwoDates(fromDate: destinationDawn, toDate: destinationDate)
////        let secondsFromChatzot = secondsFromTwoDates(fromDate: destinationChatzot, toDate: destinationDate)
////        let secondsFromSunset = secondsFromTwoDates(fromDate: destinationSunset, toDate: destinationDate)
//let secondsFromCandleLighting = secondsFromTwoDates(fromDate: destinationCandleLighting, toDate: destinationDate)
//let secondsFromHavdala = secondsFromTwoDates(fromDate: destinationHavdala, toDate: destinationDate)
//
//secondsFromEvent = [secondsFromCandleLighting - Int(weekPrayerTimes[0].time), secondsFromHavdala - Int(weekPrayerTimes[1].time)]
//
//for seconds in secondsFromEvent! {
//    if seconds > 0 {
//        setNotification(title: weekPrayerTimes[0].name, body: "String", time: Double(seconds))
//    }
//    UNUserNotificationCenter.current().getPendingNotificationRequests { (notificationRequests) in
//
//            print("👩🏼‍🦰👩🏼‍🦰👩🏼‍🦰👩🏼‍🦰Requests: \(notificationRequests)")
//    }
//    print("💫💫💫💫", seconds)
//   }
//
//print("🐒🐒🐒🐒", secondsFromEvent)
////        print("🍒🍒🍒🍒 The difference between destinationSunrise \(destinationDate) to \(destinationSunrise)destinationDate is \(secondsFromSunrise) seconds")
////        print("🍒🍒🍒🍒 The difference between destinationDawn \(destinationDate) to \(destinationDawn)destinationDate is \(secondsFromDawn) seconds")
////        print("🍒🍒🍒🍒 The difference between destinationChatzot \(destinationDate) to \(destinationChatzot)destinationDate is \(secondsFromChatzot) seconds")
////        print("🍒🍒🍒🍒 The difference between destinationSunset \(destinationDate) to \(destinationSunset)destinationDate is \(secondsFromSunset) seconds")
//print("🍒🍒🍒🍒 The difference between destinationCandleLighting \(destinationDate) to \(destinationCandleLighting)destinationDate is \(secondsFromCandleLighting) seconds")
//print("🍒🍒🍒🍒 The difference between destinationHavdala \(destinationDate) to \(destinationHavdala)destinationDate is \(secondsFromHavdala) seconds")
//if isCollapsed == false {
//    if let finalScreen = storyboard?.instantiateViewController(withIdentifier:"FinalTableViewController")as?FinalTableViewController {
//    self.navigationController?.pushViewController(finalScreen, animated: true)
//    }
//} else {
//    let alert = UIAlertController(title: "Need to add times", message: "Add your times", preferredStyle: .alert)
//    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//    self.present(alert, animated: true, completion: nil)
//}
//
//}
