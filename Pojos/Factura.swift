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
    var idMesa: Int
    var idUsuario: Int
    var horaApertura: Date
    var horaCierre: Date
    var total: Double
    
    init?(id: Int, idMesa: Int, idUsuario: Int, horaApertura: Date, horaCierre: Date, total: Double) {
        self.id = id
        self.idMesa = idMesa
        self.idUsuario = idUsuario
        self.horaApertura = horaApertura
        self.horaCierre = horaCierre
        self.total = total
    }
    
}
