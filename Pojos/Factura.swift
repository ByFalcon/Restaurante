//
//  Factura.swift
//  Restaurante
//
//  Created by dam on 05/06/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation

class Factura: NSObject {
    
    var id: Int
    var mesa: Mesa
    var horaApertura: String
    var horaCierre: String
    var total: Double
    
    init(id: Int, mesa: Mesa, horaApertura: String, horaCierre: String, total: Double) {
        self.id = id
        self.mesa = mesa
        self.horaApertura = horaApertura
        self.horaCierre = horaCierre
        self.total = total
    }
    
}
