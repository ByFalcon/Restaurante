//
//  ProductoTableViewCell.swift
//  Restaurante
//
//  Created by dam on 05/06/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit

class ProductoTableViewCell: UITableViewCell {

    @IBOutlet weak var labelNomProducto: UILabel!
    @IBOutlet weak var labelCantidadProducto: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
