//
//  ProductoTableViewController.swift
//  Restaurante
//
//  Created by Mac Mini on 12/06/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit

class ProductoTableViewController: UITableViewController, OnResponse {
    
    @IBOutlet var tableViewController: UITableView!
    var productos : [Producto] = []
    var productoSeleccionado : Producto!
    var factura: Factura?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewController.delegate = self
        tableViewController.dataSource = self
        
        guard let cliente = RestClient(service: "productos",response: self, [:]) else {
            return
        }
        cliente.request()
    }
    
    func onData(data: Data) {
        print(String(data:data,encoding:String.Encoding.utf8)!)
        do {
            let decoder = JSONDecoder()
            let productos = try decoder.decode(Productos.self, from:data)
            
            for productoRest in productos.producto{
                self.productos.append(Producto(id: productoRest.id, nombre: productoRest.nombre, precio: Double(productoRest.precio) ?? 0.0, destino: productoRest.destino, disponible: Int(productoRest.disponible)))
            }
        }catch let parsingError {
                print("Error", parsingError)
        }
        tableViewController.reloadData()
    }
    
    func onDataError(message: String) {
        print(message)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productos.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productoCelda", for: indexPath) as! ProductoTableViewCell

        let productoInsertar : [String:Any] = ["idfactura": factura?.id ?? 0,
                                               //"precio" : productos[indexPath.row].precio,
                                               "idproducto": productos[indexPath.row].id,
                                               "idusuario": 1]
        guard let cliente = RestClient(service: "comanda", response: self, [:], "POST", productoInsertar) else {
            print("error al grabar pedio")
            return
        }
        cliente.request()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productoCelda", for: indexPath) as! ProductoTableViewCell
        cell.nombreProducto.text = "\(productos[indexPath.row].getNombre())"
        return cell
    }


}
