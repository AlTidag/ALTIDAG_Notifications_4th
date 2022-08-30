//
//  CustomTableViewCell.swift
//  ALTIDAG_Notifications_1st
//
//  Created by Itzhak Duani on 07/06/2022.
//


import UIKit

class ShabatCustomCell: UITableViewCell {

    @IBOutlet weak var setTimeLbl: UILabel!
    @IBOutlet weak var onOffLabel: UILabel!
    @IBOutlet weak var timerOutlet: UIDatePicker!
    @IBOutlet weak var onOffLabelTop: UILabel!
    @IBOutlet weak var onOffButtonOutlet: UISwitch!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        timerOutlet.isUserInteractionEnabled = false
        onOffButtonOutlet.isOn = false
        timerOutlet.setValue(UIColor.systemYellow, forKeyPath: "textColor")
        DispatchQueue.main.async {

            self.timerOutlet.datePickerMode = .countDownTimer
            self.timerOutlet.minuteInterval = 1
            self.timerOutlet.countDownDuration = 15
        }
    }
    
    var prayerTime: ShabatTimeSceduale?
    
    func set(prayerTime: ShabatTimeSceduale) {
        self.prayerTime = prayerTime
        self.setTimeLbl.text = prayerTime.name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func timer(_ sender: UIDatePicker) {
        print(sender.countDownDuration)
        self.prayerTime?.time = sender.countDownDuration
        print("mame", prayerTime?.name ?? "")
        print("time", prayerTime?.time ?? "")
        print("ison", prayerTime?.isOn ?? "")
    }
    
    @IBAction func onOffSwitch(_ sender: UISwitch) {
        prayerTime?.time = 60.0
        self.prayerTime?.isOn = sender.isOn
        
        if sender.isOn == true {
            timerOutlet.isUserInteractionEnabled = true
            
            onOffLabel.text = "ON"
            onOffLabelTop.text = "ON"
        }else {
            prayerTime?.time = 0
            timerOutlet.isUserInteractionEnabled = false
           
            onOffLabel.text = "OFF"
            onOffLabelTop.text = "OFF"
        }
    }
    
    func fillTheGup() {
        
    }
}
