//
//  CoinTableViewCell.swift
//  week4
//
//  Created by Muzaffer Berşan Konal on 15.06.2022.
//

import UIKit

class CoinTableViewCell: UITableViewCell {

    @IBOutlet weak var coinName: UILabel!
    @IBOutlet weak var coinPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
