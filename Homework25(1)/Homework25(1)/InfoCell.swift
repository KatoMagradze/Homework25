//
//  InfoCell.swift
//  Homework25(1)
//
//  Created by Kato on 5/21/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {

    @IBOutlet weak var countryLabel: UILabel!    
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var bordersLabel: UILabel!
    @IBOutlet weak var currenciesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
