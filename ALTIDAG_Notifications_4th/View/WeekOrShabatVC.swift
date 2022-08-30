//
//  MainPageViewController.swift
//  ALTIDAG_Notifications_1st
//
//  Created by Itzhak Duani on 07/06/2022.
//

//
//import UIKit
//import UserNotifications
//
//class WeekOrShabatVC: UIViewController {
//
//    @IBOutlet weak var weekButtonOutlet: UIButton!
//    @IBOutlet weak var shabatButtonOutlet: UIButton!
//    @IBOutlet weak var logoLabel: UILabel!
//
//    var shabatModels: TimeModelShabat?
//    var weeklyModels: TimeModelWeekDays?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        weekButtonOutlet.tintColor = .yellow
//        weekButtonOutlet.titleLabel?.font = UIFont(name: "Helvetica", size: 55)
//        weekButtonOutlet.setTitle("Week days", for: .normal)
//        weekButtonOutlet.backgroundColor = .black
//        weekButtonOutlet.layer.cornerRadius = 31
//
//        shabatButtonOutlet.tintColor = .yellow
//        shabatButtonOutlet.titleLabel?.font = UIFont(name: "Helvetica", size: 55)
//        shabatButtonOutlet.setTitle("Shabat", for: .normal)
//        shabatButtonOutlet.backgroundColor = .black
//        shabatButtonOutlet.layer.cornerRadius = 31
//
//        if shabatModels != nil {
//            weeklyModels?.candleLightTime = shabatModels?.candleLightTitle
//            weeklyModels?.porshen = shabatModels?.porshen
//            weeklyModels?.titleOfShabat = shabatModels?.titleOfShabat
//            weeklyModels?.havdalah = shabatModels?.havdalah
//            weeklyModels?.hadalahDate = shabatModels?.havdalahDate
//        }
//    }
//
//    @IBAction func weekButton(_ sender: UIButton) {
//        if let weeklyTableVC = storyboard?.instantiateViewController(withIdentifier: "WeeklyTableVC") as? SchedualeUserTimeTableVC{
//            self.navigationController?.pushViewController(weeklyTableVC, animated: true)
//            weeklyTableVC.weeklyModels = self.weeklyModels
//
//        }
//        print("🤭🤭", shabatModels)
//        print("🤭🤭🤭🤭", weeklyModels)
//    }
//
//    @IBAction func shabatButton(_ sender: UIButton) {
//        if let shabatTableVC = storyboard?.instantiateViewController(withIdentifier: "ShabatTableVC") as? ShabatTableVC{
//            self.navigationController?.pushViewController(shabatTableVC, animated: true)
//            shabatTableVC.shabatModels = self.shabatModels
//
//    }
//        print("🤪🤪", shabatModels)
//        print(" 🤪🤪🤪🤪", weeklyModels)
//   }
//}
//
//
