//
//  StockListViewModel.swift
//  StockApp
//
//  Created by Faraz Haider on 08/01/2021.
//

import Foundation

class StockListViewModel: ObservableObject{
    
    @Published var searchTerm : String = ""
   @Published var stocks = [StockViewModel]()
    @Published var news = [NewsArticleViewModel]()
    
    
    func load(){
        fetchNews()
        fetchStocks()
    }
    
    private func fetchStocks(){
        Webservice().getStocks { (stocks) in
            if let stocks = stocks{
                    self.stocks = stocks.map(StockViewModel.init)
            }
        }
    }
    
    private func fetchNews(){
        Webservice().getTopNews { (news) in
            if let news = news{
                    self.news = news.map(NewsArticleViewModel.init)
            }
        }
    }
}
