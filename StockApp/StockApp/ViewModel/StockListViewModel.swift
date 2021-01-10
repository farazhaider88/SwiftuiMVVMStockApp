//
//  StockListViewModel.swift
//  StockApp
//
//  Created by Faraz Haider on 08/01/2021.
//

import Foundation

class StockListViewModel: ObservableObject{
    
    var searchTerm : String = ""
   @Published var stocks = [StockViewModel]()
    
    
    func load(){
        fetchStocks()
    }
    
    private func fetchStocks(){
        Webservice().getStocks { (stocks) in
            if let stocks = stocks{
                DispatchQueue.main.async {
                    self.stocks = stocks.map(StockViewModel.init)
                }
            }
        }
    }
}
