//
//  Webservice.swift
//  StockApp
//
//  Created by Faraz Haider on 08/01/2021.
//

import Foundation

class Webservice{
    
    func getTopNews(completion:@escaping(([Article]?)->Void)){
        
        guard let url = URL(string: "https://island-bramble.glitch.me/top-news") else{
            fatalError("Url is not correct")
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
           
            guard let data = data, error == nil else{
                DispatchQueue.main.async {
                    completion(nil)
                }
               
                return
            }
            
            let article = try? JSONDecoder().decode([Article].self, from: data)

            DispatchQueue.main.async {
                 completion(article)
            }
          
            
        }.resume()
    }

    
    
    
    func getStocks(completion:@escaping(([Stocks]?)->Void)){
        
        guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else{
            fatalError("Url is not correct")
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
           
            guard let data = data, error == nil else{
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let stocks = try? JSONDecoder().decode([Stocks].self, from: data)
            DispatchQueue.main.async {
                completion(stocks)
            }
           
            
        }.resume()
    }
}
