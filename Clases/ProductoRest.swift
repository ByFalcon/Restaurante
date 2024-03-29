//
//  ProductoRest.swift
//  Restaurante
//
//  Created by dam on 05/06/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation

struct ProductoRest: Codable {
    var id: Int
    var nombre: String
    var precio: String
    var destino: String
    var disponible: Int
}


struct Productos:Codable {
    var producto: [ProductoRest]
}
