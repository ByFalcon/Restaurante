//
//  FacturaTableViewCell.swift
//  Restaurante
//
//  Created by Mac Mini on 12/06/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit

class FacturaTableViewCell: UITableViewCell {

    @IBOutlet weak var labelProd: UILabel!
    @IBOutlet weak var labelPrecio: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
