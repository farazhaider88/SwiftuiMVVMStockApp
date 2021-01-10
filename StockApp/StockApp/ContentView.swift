//
//  ContentView.swift
//  StockApp
//
//  Created by Faraz Haider on 08/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private  var searchTerm : String = ""
    
    
    var body: some View {

        NavigationView{
          
            ZStack(alignment: .leading){
                Color.black
                Text("January 6 2020")
                    .font(.custom("Arial", size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -330)
                
                
                SearchView(searchTerm: $searchTerm).offset(y:-290)
                
            }
            
                .navigationBarTitle("Stocks")
            
        }.edgesIgnoringSafeArea(Edge.Set(.bottom))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
