//
//  CelloTableViewCell.swift
//  idm262-pcn23
//
//  Created by Nix,Parker on 3/9/23.
//

import UIKit

class CelloTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
