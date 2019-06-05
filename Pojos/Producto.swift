//
//  Producto.swift
//  Restaurante
//
//  Created by dam on 05/06/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation

class Producto: NSObject {
    
    var id: Int
    var nombre: String
    var precio: Double
    var destino: String
    var disponible: Int
    
    init?(id: Int, nombre: String, precio: Double, destino: String, disponible: Int) {
        self.id = id
        self.nombre = nombre
        self.precio = precio
        self.destino = destino
        self.disponible = disponible
    }
    
}
