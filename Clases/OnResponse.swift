//
//  OnResponse.swift
//  Restaurante
//
//  Created by dam on 05/06/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation

protocol OnResponse {
    func onData(data: Data)
    func onDataError(message: String)
}
