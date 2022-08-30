//
//  FinalTableViewController.swift
//  ALTIDAG_Notifications_1st
//
//  Created by Itzhak Duani on 12/06/2022.
//

import UIKit

class FinalTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var finalTableView: UITableView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var changeTimeBtnOutlet: UIButton!
    
    var timeManagerLatLonShabat = TimeManagerLatLonShabat()
    //    information from api about the times for shabat
    var shabatModels: TimeModelShabat?
    //    information the user enter of how long before an event they want to be notified.
    var secondsFromEvent: [Int] = []
    //    array of info, the time before the event, the name of the event, and weather the cell collapsed or not
    var weekPrayerTime = [PrayerTime]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeTimeBtnOutlet.layer.cornerRadius = 22
        changeTimeBtnOutlet.layer.borderColor = UIColor.gray.cgColor
        finalTableView.rowHeight = UITableView.automaticDimension
        finalTableView.register(UINib(nibName: "FinalTableViewCell", bundle: nil), forCellReuseIdentifier: "ShowTimesCell")
        
    }
    
    func minutesToHoursAndMinutes(_ minutes: Int) -> (hours: Int , leftMinutes: Int) {
        return (minutes / 60, (minutes % 60))
    }
    
    @IBAction func changeTimeBtn(_ sender: UIButton) {
        if let shabatSetTime = storyboard?.instantiateViewController(withIdentifier: "ShabatTableViewController") as? ShabatTableVC{
            self.navigationController?.pushViewController(shabatSetTime, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 126
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return secondsFromEvent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = finalTableView.dequeueReusableCell(withIdentifier: "ShowTimesCell", for: indexPath) as! FinalTableViewCell
        
        cell.layer.borderWidth = 4
        cell.layer.cornerRadius = 22
        cell.clipsToBounds = true
       
        cell.descriptionLabel.text = weekPrayerTime[indexPath.row].name
        cell.eventTimeLbl.text = String(weekPrayerTime[indexPath.row].time)
      
        return cell
        
    }
    
}

//
//// Step 1: Ask for permission
//let center = UNUserNotificationCenter.current()
//
//center.requestAuthorization(options: [.alert, .sound]) { granted, error in
//
//// Step 2: Create the notification content
//let content = UNMutableNotificationContent()
//    content.title = "Hey im a notification!"
//    content.body = "Im the body"
//
//    // Step 3: Create the notification trigger
//    let date = Date().addingTimeInterval(5)
//
//    let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
//
//    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
//
//    // Step 4:  Create the request
//
//    let uuidString = UUID().uuidString
//    let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
//
//    // Register Request with notifiction
//    center.add(request) { (error) in
//        // Check the error parameter and handle any errors
//
//    }
//
//
//}
//
//
//
//
//
