//
//  History.swift
//  licativo
//
//  Created by Nadia Bordoni on 16/03/20.
//  Copyright © 2020 Nadia Bordoni. All rights reserved.
//

import Foundation

class Historico {
    var role: [String]
    var valorMensal: Int
    var valorGasto: String
    
    init(role: [String], valorMensal: Int, valorGasto: String) {
        self.role = role
        self.valorMensal = valorMensal
        self.valorGasto = valorGasto
    }
}
