//
//  CustomTableViewCell.swift
//  ALTIDAG_Notifications_1st
//
//  Created by Itzhak Duani on 07/06/2022.
//


import UIKit

protocol IsOnOrOffDelegate {
    func didSwitch()
}

class WeeklyCustomCell: UITableViewCell{
    
// Setting buttons and outlets for the custom cell
    @IBOutlet weak var setTimeLbl: UILabel!
    @IBOutlet weak var onOffLabel: UILabel!
    @IBOutlet weak var timerOutlet: UIDatePicker!
    @IBOutlet weak var onOffButtonOutlet: UISwitch!
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var cellView: UIView!
    
    var delegate: IsOnOrOffDelegate?
    var prayerTime = weekPrayerTimes
    
    override func awakeFromNib() {
        super.awakeFromNib()
//    Makes the timer spinner disabled
        cellView.backgroundColor = .gray
        stack.backgroundColor = .gray
        print("🧑🏼‍🌾🧑🏼‍🌾🧑🏼‍🌾🧑🏼‍🌾🧑🏼‍🌾🧑🏼‍🌾", prayerTime[0].name)
        print("🧑🏼‍🌾🧑🏼‍🌾🧑🏼‍🌾🧑🏼‍🌾🧑🏼‍🌾🧑🏼‍🌾", prayerTime[0].time)
        print("🧑🏼‍🌾🧑🏼‍🌾🧑🏼‍🌾🧑🏼‍🌾🧑🏼‍🌾🧑🏼‍🌾", prayerTime[1].name)
        print("🧑🏼‍🌾🧑🏼‍🌾🧑🏼‍🌾🧑🏼‍🌾🧑🏼‍🌾🧑🏼‍🌾", prayerTime[1].time)
        timerOutlet.isUserInteractionEnabled = false
        onOffButtonOutlet.isOn = false
        timerOutlet.backgroundColor = .gray
        timerOutlet.setValue(UIColor.systemYellow, forKeyPath: "textColor")
        DispatchQueue.main.async {
            self.timerOutlet.datePickerMode = .countDownTimer
            self.timerOutlet.minuteInterval = 1
            self.timerOutlet.countDownDuration = 15
        }
    }
    
//    This refer to the struct contains "name "Ison" etc...
    var weekPrayerTime: PrayerTime?
//    Taking the info and attaching it to weekPrayerTime (line above)
    func set(prayerTime: PrayerTime) {
        self.weekPrayerTime = prayerTime
        self.setTimeLbl.text = prayerTime.name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func timer(_ sender: UIDatePicker) {
        print(sender.countDownDuration)
        self.weekPrayerTime?.time = sender.countDownDuration
        print("prayerTime's time", self.weekPrayerTime!.time)
        print("mame", weekPrayerTime?.name ?? "")
        print("time", weekPrayerTime?.time ?? "")
        print("ison", weekPrayerTime?.isOn ?? "")
    }
    
    @IBAction func onOffSwitch(_ sender: UISwitch) {
        weekPrayerTime?.time = 60.0
        self.weekPrayerTime?.isOn = sender.isOn

        self.delegate?.didSwitch()
        
        if sender.isOn == true {
            cellView.backgroundColor = .black
            timerOutlet.isUserInteractionEnabled = true
            onOffLabel.text = "ON"
            onOffLabel.textColor = .systemYellow
            timerOutlet.backgroundColor = .black
            stack.backgroundColor = .black
        }else {
            cellView.backgroundColor = .gray
            weekPrayerTime?.time = 0
            timerOutlet.isUserInteractionEnabled = false
            onOffLabel.text = "OFF"
            timerOutlet.backgroundColor = .gray
            stack.backgroundColor = .gray
        }
    }
    
    func fillTheGup() {
        
    }
}
