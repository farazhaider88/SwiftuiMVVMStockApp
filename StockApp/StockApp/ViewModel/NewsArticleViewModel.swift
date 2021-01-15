//
//  NewsArticleViewModel.swift
//  StockApp
//
//  Created by Faraz Haider on 14/01/2021.
//

import Foundation

struct NewsArticleViewModel{
    
    let article:Article
    
    var imageUrl : String{
        return self.article.imageURL
    }
    
    var title: String{
        return self.article.title
    }
    
    var publications : String{
        return self.article.publication.uppercased()
    }
}
