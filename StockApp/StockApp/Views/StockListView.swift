//
//  StockListView.swift
//  StockApp
//
//  Created by Faraz Haider on 12/01/2021.
//

import SwiftUI

struct StockListView: View {
    let stocks : [StockViewModel]
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        List(self.stocks, id: \.symbol){
            stock in
            StockCellView(stock:stock)
        }
    }
}


struct StockCellView : View {
    let stock : StockViewModel
    
    var body : some View{
        
        return HStack{
            VStack(alignment: .leading){
                
                Text(stock.symbol)
                    .font(.custom("Arial", size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                
                Text(stock.description)
                    .font(.custom("Arial", size: 18))
                    .foregroundColor(.gray)
                
            }
            
            Spacer()
            
            VStack{
                
                Text("\(stock.price)")
                    .font(.custom("Arial", size: 22))
                    .foregroundColor(.blue)
                
                Button(stock.change) {
                    
                }.frame(width: 75)
                .padding(5)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(6)
                
                
            }
        }
        
    }
}

struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        
        let stock = Stocks(symbol: "GGGG", description: "Google Stock", price: 1200, change: "+0.23")
        return Group {
            StockListView(stocks: [StockViewModel(stock: stock)])
        }
    }
}
