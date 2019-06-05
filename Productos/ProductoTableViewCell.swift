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
    @IBOutlet weak var buttonMenos: UIButton!
    @IBOutlet weak var buttonMas: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func sumarCantidad(_ sender: Any) {
        var num:Int = Int(labelCantidadProducto.text ?? "0") ?? 0
        num += 1
        labelCantidadProducto.text = String(num)
    }
    
    @IBAction func restarCantidad(_ sender: Any) {
        
        var num:Int = Int(labelCantidadProducto.text ?? "0") ?? 0
        if num>0 {
            num -= 1
        }
        labelCantidadProducto.text = String(num)
    }
}
