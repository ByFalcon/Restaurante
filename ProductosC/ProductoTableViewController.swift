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
    var productosInsertar : [Productos] = []
    var productoSeleccionado : Producto!
    
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
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productoCelda", for: indexPath) as! ProductoTableViewCell
        cell.nombreProducto.text = "\(productos[indexPath.row].getNombre())"
        cell.cantidadProducto.text = "0"
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}