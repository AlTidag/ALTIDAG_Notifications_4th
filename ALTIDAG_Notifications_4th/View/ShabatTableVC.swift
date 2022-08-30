//
//  TableViewController.swift
//  ALTIDAG_Notifications_1st
//
//  Created by Itzhak Duani on 07/06/2022.
//


import UIKit

class ShabatTimeSceduale {
    var name: String
    var time: Double
    var isOn: Bool
    init(name: String, time: Double, isOn: Bool) {
        self.name = name
        self.time = time
        self.isOn = isOn
    }
}

class ShabatTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let shabatPrayerTimes = [ShabatTimeSceduale(name: "Candle lighting", time: 0.0, isOn: false),
//                             ShabatTimeSceduale(name: "Dawn", time: 0.0, isOn: false),
//                             ShabatTimeSceduale(name: "Midday", time: 0.0, isOn: false),
//                             ShabatTimeSceduale(name: "Mincha", time: 0.0, isOn: false),
                             ShabatTimeSceduale(name: "End of shabat", time: 0.0, isOn: false)]
    
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var holTableView: UITableView!
    
    var shabatModels: TimeModelShabat?
    let customTVCell = ShabatCustomCell()
    var selectedIndex = -1
    var isCollapsed = Bool()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        holTableView.rowHeight = UITableView.automaticDimension
        holTableView.register(UINib(nibName: "ShabatCustomCell", bundle: nil), forCellReuseIdentifier: "customCellShabat")
//        print("😇😇😇😇",shabatModels)
    }
    
    @IBAction func addLocationBtnShabat(_ sender: UIButton) {
        if let shabatNextVC = storyboard?.instantiateViewController(withIdentifier: "ShabatSearchVC") as? LocationSearchVC{
            self.navigationController?.pushViewController(shabatNextVC, animated: true)
            shabatNextVC.timeBeforePrayer = shabatPrayerTimes
        }
        
    }
//    defines the height of the cell's
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
//        if selectedIndex == indexPath.row && isCollapsed == true {
//            return 220
//        }else {
//            return 55
//        }
    }
//    defines the number of rows in the tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shabatPrayerTimes.count
    }
//    connect the custom cell to the tableview
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = holTableView.dequeueReusableCell(withIdentifier: "customCellShabat", for: indexPath) as! ShabatCustomCell
        
        let shabatPrayerTime = shabatPrayerTimes[indexPath.row]
        cell.set(prayerTime: shabatPrayerTime)
        
        cell.layer.borderColor = UIColor.systemYellow.cgColor
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 22
        cell.clipsToBounds = true
        
        return cell
    }
//    defines if user did tap the cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
//        if selectedIndex == indexPath.row {
//            if isCollapsed == false {
//                isCollapsed = true
//            }else{
//                isCollapsed = false
//            }
//        }else {
//            isCollapsed = true
//        }
        shabatPrayerTimes.forEach { print("Name: \($0.name), time: \($0.time)") }
        selectedIndex = indexPath.row
        
//        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    

   
}


