//
//  FruitsTableViewCell.swift
//  GaganDemoApp
//
//  Created by Gagan S on 08/08/21.
//

import UIKit

class FruitsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labeltext : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
