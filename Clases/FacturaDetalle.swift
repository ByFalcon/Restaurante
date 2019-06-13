//
//  FacturaDetalle.swift
//  Restaurante
//
//  Created by dam on 13/06/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation

struct FacturaDetalle:Codable {
    
    struct FacturaRest: Codable {
        var id:Int
        var horacierre : String?
        var total : String
    }
    
    struct ProductoRest: Codable {
        var id : Int
        var nombre:String
        var precio : String
        var destino : String
        var disponible : Int
    }
    
    struct ComandaRest:Codable {
        var id : Int
        var precio : String
    }
    
    let factura : [FacturaRest]
    let comanda : [ComandaRest]
    let producto : [ProductoRest]
    
    
    
}
