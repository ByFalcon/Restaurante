//
//  MesasCollectionViewController.swift
//  Restaurante
//
//  Created by dam on 05/06/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit

class MesasCollectionViewController: UICollectionViewController, OnResponse{

    
    @IBOutlet var mesaCollectionView: UICollectionView!
    var mesas : [Mesa] = []
    var mesaSeleccionada : Mesa!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mesaCollectionView.delegate = self
        mesaCollectionView.dataSource = self
        
        
        guard let cliente = RestClient(service: "mesa",response: self, [:]) else {
            return
        }
        cliente.request()
    }
    
    
    func onData(data: Data) {
        print(String(data:data,encoding:String.Encoding.utf8)!)
        do {
            let decoder = JSONDecoder()
            let mesas = try decoder.decode(Mesas.self, from:data)
            
            for mesaRest in mesas.mesa{
                self.mesas.append(Mesa(id: mesaRest.id, localizacion: mesaRest.localizacion, incremento: Double(mesaRest.incremento) ?? 0.0))
            }
            
            mesaCollectionView.reloadData()
        } catch let parsingError {
            print("Error", parsingError)
        }
    }
    
    func onDataError(message: String) {
        print(message)
    }
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int ) -> Int{
        return mesas.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.mesaSeleccionada = mesas[indexPath.row]
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda: CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "celdaMesa", for: indexPath) as! CollectionViewCell
        celda.labelMesa.text = "\(mesas[indexPath.row].getId())"
        return celda
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let DetailViewController = segue.destination as? FacturaTableViewController else {
            fatalError("Unexpected destination: \(segue.destination)")
        }
        guard let selectedMesaCell = sender as? CollectionViewCell else {
            fatalError("Unexpected sender: \(sender)")
        }
        
        guard let indexPath = mesaCollectionView.indexPath(for: selectedMesaCell) else {
            fatalError("The selected cell is not being displayed by the table")
        }
        
        let mesaSeleccionada = mesas[indexPath.row]
        DetailViewController.mesa = mesaSeleccionada
        
    }*/
}
