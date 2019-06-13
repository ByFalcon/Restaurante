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
    var factura: Factura
    var producto: Producto
    var precio: Double
    
    init(id: Int, factura:Factura, producto: Producto, precio: Double) {
        self.id = id
        self.factura = factura
        self.producto = producto
        self.precio = precio
    }
}
