//
//  Usuario.swift
//  Restaurante
//
//  Created by dam on 05/06/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation

class Usuario: NSObject{
    
    var id: Int
    var login: String
    var clave: String
    
    init?(id: Int, login: String, clave: String) {
        self.id = id
        self.login = login
        self.clave = clave
    }
}
