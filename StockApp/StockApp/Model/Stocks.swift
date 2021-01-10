//
//  Stocks.swift
//  StockApp
//
//  Created by Faraz Haider on 08/01/2021.
//

import Foundation

struct Stocks :Decodable{
    let symbol: String
    let description : String
    let price : Double
    let change : String
}
