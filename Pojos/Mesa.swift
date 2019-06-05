//
//  Mesa.swift
//  Restaurante
//
//  Created by dam on 05/06/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation

class Mesa: NSObject {
    
    var id: Int
    var localizacion: String
    var incremento: Double
    
    init(id: Int, localizacion: String, incremento: Double) {
        self.id = id
        self.localizacion = localizacion
        self.incremento = incremento
    }
    
    func getId()->Int{
        return self.id
    }
    
    func setId(id:Int) {
        self.id = id
    }
    
    func getLocalizacion()->String{
        return self.localizacion
    }
    
    func setLocalizacion(localizacion:String){
        self.localizacion = localizacion
    }
    
    func getIncremento()->Double{
        return self.incremento
    }
    
    func setIncremento(incremento:Double){
        self.incremento = incremento
    }
}
