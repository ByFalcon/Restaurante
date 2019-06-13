//
//  FacturaViewController.swift
//  Restaurante
//
//  Created by dam on 13/06/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit

class FacturaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, OnResponse {
    
    @IBOutlet weak var Tabla: UITableView!
    @IBOutlet weak var Total: UILabel!
    @IBOutlet weak var labelNMesa: UILabel!
    
    var mesa: Mesa?
    var factura: Factura?
    var productos: [Producto] = []
    var comandas: [Comanda] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Tabla.delegate = self
        Tabla.dataSource = self
        
        if let mesa = self.mesa{
            labelNMesa.text = "MESA \(mesa.id)"
            guard let cliente = RestClient(service: "facturamesa/\(mesa.getId())",response: self, [:]) else {
                return
            }
            cliente.request()
        }
    }
    
    func onData(data: Data) {
        print(String(data:data,encoding:String.Encoding.utf8)!)
        do {
            let decoder = JSONDecoder()
            let facturaCompleta = try decoder.decode(FacturaDetalle.self, from:data)
            
            
            for facturaDeMesa in facturaCompleta.factura{
                self.factura = Factura(id: facturaDeMesa.id, mesa: mesa!, horaApertura: "", horaCierre: facturaDeMesa.horacierre ?? "", total: Double(facturaDeMesa.total) ?? 0.0)
            }
            
            for productoDeMesa in facturaCompleta.producto{
                productos.append(Producto(id: productoDeMesa.id, nombre: productoDeMesa.nombre, precio: Double(productoDeMesa.precio) ?? 0.0, destino: productoDeMesa.destino, disponible: Int(productoDeMesa.disponible) ))
            }
            var c = 0
            for comandaDeMesa in facturaCompleta.comanda{
                comandas.append(Comanda(id: comandaDeMesa.id, factura: factura!, producto: productos[c], precio: Double(comandaDeMesa.precio) ?? 0))
                c+=1
            }
            c = 0
            
            Tabla.reloadData()
        } catch let parsingError {
            print("Error", parsingError)
        }
    }
    
    func onDataError(message: String) {
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //celdaFactura
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaFactura", for: indexPath) as! FacturaTableViewCell
        var total:Double = 0.0
        for comanda in comandas{
            total += comanda.precio
        }
        Total.text = "\(total)€"
        
        
        cell.labelProd.text = productos[indexPath.row].nombre
        cell.labelPrecio.text = "\(productos[indexPath.row].precio)"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        
        guard let addProductos = segue.destination as? ProductoTableViewController else {
            fatalError("Unexpected destination: \(segue.destination)")
        }
        addProductos.factura = factura
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
