//
//  Comanda.swift
//  Restaurante
//
//  Created by dam on 05/06/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation

class Comanda: NSObject{
    
    var id: Int
    var idFactura: Int
    var idProducto: Int
    var idUsuario: Int
    var precio: Double
    
    init?(id: Int, idFactura: Int, idProducto: Int, idUsuario: Int, precio: Double) {
        self.id = id
        self.idFactura = idFactura
        self.idProducto = idProducto
        self.idUsuario = idUsuario
        self.precio = precio
    }
    
}
