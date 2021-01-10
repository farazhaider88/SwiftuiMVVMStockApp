//
//  Webservice.swift
//  StockApp
//
//  Created by Faraz Haider on 08/01/2021.
//

import Foundation

class Webservice{
    
    func getStocks(completion:@escaping(([Stocks]?)->Void)){
        
        guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else{
            fatalError("Url is not correct")
        }

        URLSession().dataTask(with: url) { (data, response, error) in
           
            guard let data = data, error == nil else{
                completion(nil)
                return
            }
            
            let stocks = try? JSONDecoder().decode([Stocks].self, from: data)
            stocks == nil ? completion(nil) : completion(stocks)
            
        }.resume()
    }
}
