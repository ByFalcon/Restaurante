//
//  ComandaRest.swift
//  Restaurante
//
//  Created by dam on 05/06/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation

struct ComandaRest: Codable{
    var id: Int
    var idfactura: Int
    var idproducto: Int
    var idusuario: Int
    var precio: Double
}
