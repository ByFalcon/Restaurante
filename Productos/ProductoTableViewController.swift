//
//  ProductoTableViewController.swift
//  Restaurante
//
//  Created by dam on 05/06/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit

class ProductoTableViewController: UITableViewController, OnResponse {
    
    var productos : [Producto] = []
    var productoSeleccionado : Producto!
    var productosInsertar: [Producto] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.delegate = self
        //tableView.dataSource = self
        print("entra")
        guard let cliente = RestClient(service: "productos", response: self, [:]) else {
            print("error")
            return
        }
        print("peticion")
        cliente.request()
    }

    func onData(data: Data) {
        print(String(data:data,encoding:String.Encoding.utf8)!)
        do {
            let decoder = JSONDecoder()
            let productosR = try decoder.decode(Productos.self, from:data)
            
            for productoRest in productosR.producto {
                self.productos.append(Producto(id: productoRest.id, nombre: productoRest.nombre, precio: Double(productoRest.precio) ?? 0.0, destino: productoRest.destino, disponible: Int(productoRest.disponible)))
            }
            
            tableView.reloadData()
        } catch let parsingError {
            print("Error", parsingError)
        }
    }
    
    func onDataError(message: String) {
        print(message)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productos.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.productoSeleccionado = productos[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "productoCell", for: indexPath) as? ProductoTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        var cantidadString: String = (cell.labelCantidadProducto.text ?? "0")
        var cantidad: Int = Int(cantidadString) ?? 0
        cantidad+=1
        cell.labelCantidadProducto.text = "\(cantidad)"
        productosInsertar.append(productoSeleccionado)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "productoCell", for: indexPath) as? ProductoTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        cell.labelNomProducto.text = "\(productos[indexPath.row].getNombre())"
        cell.labelCantidadProducto.text = "\(productos[indexPath.row].getPrecio())"
        return cell
    }
}
