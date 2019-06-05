//
//  FacturaRest.swift
//  Restaurante
//
//  Created by dam on 05/06/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation

struct FacturaRest: Codable {
    var id: Int
    var idmesa: Int
    var idusuario: Int
    var horaapertura: Date
    var horacierre: Date
    var total: Double
}
