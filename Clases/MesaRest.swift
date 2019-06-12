//
//  MesaRest.swift
//  Restaurante
//
//  Created by dam on 05/06/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation

struct MesaRest: Codable {
    var id: Int
    var localizacion: String
    var incremento: String
}

struct Mesas:Codable {
    let mesa: [MesaRest]
}
