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
    
    init(id: Int, nombre: String, precio: Double, destino: String, disponible: Int) {
        self.id = id
        self.nombre = nombre
        self.precio = precio
        self.destino = destino
        self.disponible = disponible
    }
    
    func getId()->Int{
        return self.id
    }
    
    func setId(id:Int) {
        self.id = id
    }
    
    func getNombre()->String{
        return self.nombre
    }
    
    func setNombre(nombre:String) {
        self.nombre = nombre
    }
    
    func getPrecio()->Double{
        return self.precio
    }
    
    func setPrecio(precio:Double) {
        self.precio = precio
    }
    
    func getDestino()->String{
        return self.destino
    }
    
    func setDestino(destino: String){
        self.destino = destino
    }
    
    func getDisponible()->Int{
        return self.disponible
    }
    
    func setDisponible(disponible: Int){
        self.disponible = disponible
    }
}
