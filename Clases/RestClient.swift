//
//  Restlient.swift
//  Restaurante
//
//  Created by dam on 05/06/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation

class RestClient {
    
    let urlApi: String = "https://restaurante-danielarellanoalabarce.c9users.io/comanda/proyecto/"
    let respuesta: OnResponse
    var urlPeticion: URLRequest
    
    init?(service: String, response: OnResponse, _ extraHeader: [String: String],
          _ method: String = "GET", _ data : [String:Any] = [:]) {
        guard let url = URL(string: self.urlApi + service) else {
            return nil
        }
        self.respuesta = response
        self.urlPeticion = URLRequest(url: url)
        self.urlPeticion.httpMethod = method
        self.urlPeticion.addValue("application/json",forHTTPHeaderField: "Content-Type")
        self.urlPeticion.addValue("application/json",forHTTPHeaderField: "Accept")
        if extraHeader.count > 0 {
            for key in extraHeader.keys{
                if let value = extraHeader[key]{
                    self.urlPeticion.addValue(value, forHTTPHeaderField: key)
                }
            }
        }
        if method != "GET" && data.count > 0 {
            guard let json = Util.dictToJson(data: data) else {
                return nil
            }
            
            self.urlPeticion.httpBody = json
        }
    }
    func request() {
        let sesion = URLSession(configuration: URLSessionConfiguration.default)
        let task = sesion.dataTask(with: self.urlPeticion,completionHandler: self.callBack)
        task.resume()
    }
    
    private func callBack(_ data: Data?, _ respuesta: URLResponse?, _ error: Error?) {
        DispatchQueue.main.async {
            guard error == nil else {
                self.respuesta.onDataError(message: "error http")
                return
            }
            guard let datos = data else {
                self.respuesta.onDataError(message: "error datos")
                return
            }
            self.respuesta.onData(data: datos)
        }
    } 
}
