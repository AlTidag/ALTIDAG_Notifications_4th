//
//  FinalTableViewCell.swift
//  ALTIDAG_Notifications_1st
//
//  Created by Itzhak Duani on 12/06/2022.
//

import UIKit


class FinalTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageDescription: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var eventTimeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
