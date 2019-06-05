//
//  MesasCollectionViewController.swift
//  Restaurante
//
//  Created by dam on 05/06/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit

private let reuseIdentifier = "celdaMesa"
var mesasList = [Mesa]()
var imagenmesa = UIImage(named: "imagenmesa")
//var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

class MesasCollectionViewController: UICollectionViewController, OnResponse {
    func onDataError(message: String) {
        print("error")
    }
    
    @IBOutlet var mesaCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        //print(String(data:data,encoding:String.Encoding.utf8)!)
        guard let cliente = RestClient(service: "mesa",response: self, [:]) else {
            return
        }
        cliente.request()
    }
    
    func onData(data: Data){
        do {
            let decoder = JSONDecoder()
            let mesas = try decoder.decode(Mesar.self, from:data)
            
            for mesaRest in mesas.mesa {
                mesasList.append(Mesa(id: Int(mesaRest.id), localizacion: String(mesaRest.localizacion), incremento: Double(mesaRest.incremento) ))
            }
            
            
            //activityIndicator.stopAnimating()
            mesaCollectionView.reloadData()
        } catch let parsingError {
            print("Error", parsingError)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return mesasList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CollectionViewCell else {
            fatalError("error")
        }
        let mesa = mesasList[indexPath.row]
        cell.imagen.image = imagenmesa
        cell.labelMesa.text = "Mesa \(mesa.getId())"
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
