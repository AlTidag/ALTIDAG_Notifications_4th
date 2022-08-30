//
//  WeeklyTableViewController.swift
//  ALTIDAG_Notifications_1st
//
//  Created by Itzhak Duani on 10/06/2022.
//


import UIKit
import CoreLocation
import UserNotifications




class SchedualeUserTimeTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource, IsOnOrOffDelegate {
   
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var weekTableView: UITableView!
    @IBOutlet weak var saveBuutonOutlet: UIButton!
    
    let customTVCell = WeeklyCustomCell()
    var selectedIndex = -1
    var dawnSceduale: Double = 0
    var middaySceduale: Double = 0
    var minchaSceduale: Double = 0
    var arvitSceduale: Double = 0
    var secondsFromEvent: [Int]?
    
    var isCollapsed = false
    
    var weeklyModels: TimeModelWeekDays?
    var shabatModels: TimeModelShabat?
    var prayerTime: PrayerTime?
    var newOffsetTimeZones = Int()
    let center = UNUserNotificationCenter.current()
    
    var dawnDate: Date?
    var sunriseDate: Date?
    var chatzotDate: Date?
    var sunsetDate: Date?
    var candleLightinDate: Date?
    var havdalaDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        printing the time diffrence from the searched location to UTC +0000
        print("🌧🌧🌧🌧",newOffsetTimeZones)
        isCollapsed = false
        saveBuutonOutlet.layer.cornerRadius = 8
        saveBuutonOutlet.layer.borderWidth = 3
        saveBuutonOutlet.layer.borderColor = CGColor(red: -0.5, green: -0.5, blue: -0.5, alpha: 1)
        
        weekTableView.rowHeight = UITableView.automaticDimension
        weekTableView.register(UINib(nibName: "WeeklyCustomCell", bundle: nil), forCellReuseIdentifier: "customCellWeekly")
        
        if shabatModels != nil {
            weeklyModels!.porshen = shabatModels!.porshen
            weeklyModels!.titleOfShabat = shabatModels!.titleOfShabat
            weeklyModels!.candleLightTitle = shabatModels!.candleLightTitle
//            Converting the string dates into Date()
            sunriseDate = dateFormatDate(date: weeklyModels!.sunrise)
            dawnDate = dateFormatDate(date: weeklyModels!.dawn)
            chatzotDate = dateFormatDate(date: weeklyModels!.chatzot)
            sunsetDate = dateFormatDate(date: weeklyModels!.sunset)
            candleLightinDate = dateFormatDate(date: shabatModels!.candleLightTime)
            havdalaDate = dateFormatDate(date: shabatModels!.havdalahDate)
        }
        print("🦁🦁🦁🦁",weeklyModels!)
        
    }
    
    func setNotification(title: String, body: String, time: Double) {
   
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    content.sound = .defaultRingtone
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    center.add(request)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = weekTableView.dequeueReusableCell(withIdentifier: "customCellWeekly", for: indexPath) as! WeeklyCustomCell
        
        let weekPrayerTime = weekPrayerTimes[indexPath.row]
        cell.set(prayerTime: weekPrayerTime)
        cell.delegate = self
        cell.layer.borderColor = UIColor.systemYellow.cgColor
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 22
        cell.clipsToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        weekPrayerTimes.forEach { print("Name: \($0.name), time: \($0.time)") }
        selectedIndex = indexPath.row
        //        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func didSwitch() {
        isCollapsed = weekPrayerTimes.reduce(false) { partialResultOnOff, prayerTime in
            partialResultOnOff || prayerTime.isOn
        }
    }
    
    func didReceiveUserNotificationTimes(times: [PrayerTime]?) {
        
    }
    
    @IBAction func setSchedules(_ sender: UIButton) {
       
        let date = Date()
//        Adding or subtracting time from +0000 current date of the location
        let destinationDate = addingSeconds(seconds: newOffsetTimeZones, date: date)
        //        Adding or subtracting time from +0000 date
        let destinationCandleLighting = addingSeconds(seconds: newOffsetTimeZones, date: candleLightinDate!)
        let destinationHavdala = addingSeconds(seconds: newOffsetTimeZones, date: havdalaDate!)
        
//        Finding the diffrence in time betwin 2 dates
        let secondsFromCandleLighting = secondsFromTwoDates(fromDate: destinationCandleLighting, toDate: destinationDate)
        let secondsFromHavdala = secondsFromTwoDates(fromDate: destinationHavdala, toDate: destinationDate)
        
        secondsFromEvent = [secondsFromCandleLighting - Int(weekPrayerTimes[0].time), secondsFromHavdala - Int(weekPrayerTimes[1].time)]
        
        let names_with_index = secondsFromEvent!.enumerated()
        for (index, seconds) in names_with_index {
            
            if seconds > 0 {
                setNotification(title: weekPrayerTimes[index].name, body: "You set it for \(seconds) seconds before", time: Double(seconds))
                //                setNotification(title: weekPrayerTimes[1].name, body: "You set it for \(seconds) seconds before", time: Double(seconds))
            }
        }
    
        print("🐒🐒🐒🐒", secondsFromEvent)
       
        if isCollapsed == true {
            if let finalScreen = storyboard?.instantiateViewController(withIdentifier:"FinalTableViewController")as?FinalTableViewController {
            self.navigationController?.pushViewController(finalScreen, animated: true)
                finalScreen.secondsFromEvent = secondsFromEvent!
                finalScreen.weekPrayerTime = weekPrayerTimes
            }
        } else {
            let alert = UIAlertController(title: "No times were Scheduled", message: "Choose time before event", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
      
    }
    
}

