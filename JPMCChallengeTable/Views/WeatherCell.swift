//
//  WeatherCell.swift
//  JPMCChallengeTable
//
//  Created by Sean Murphy on 8/11/22.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var timepointLabel: UILabel!
    @IBOutlet weak var transparencyLabel: UILabel!
    @IBOutlet weak var cloudCover: UILabel!
    @IBOutlet weak var windImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
