//
//  NewsArticleView.swift
//  StockApp
//
//  Created by Faraz Haider on 14/01/2021.
//

import SwiftUI
import URLImage

struct NewsArticleView: View {
    
    let newsArticles : [NewsArticleViewModel]
    let onDragBegin : (DragGesture.Value) -> Void
    let onDragEnd : (DragGesture.Value) -> Void
    
    var body: some View {
        
        
        let screenSize = UIScreen.main.bounds.size
        
        return VStack(alignment:.leading){
            
            HStack{
                VStack(alignment:.leading){
                    Text("TOP NEWS")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(2)
                        
                    
                    Text("From apple NEWS")
                        .foregroundColor(.gray)
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(2)
                    
                }
                
                Spacer()
            }.padding().contentShape(Rectangle())
            .gesture(DragGesture().onChanged(self.onDragBegin)
                        .onEnded(self.onDragEnd))
           
                
                ScrollView{
                    VStack{
                        ForEach(self.newsArticles,id:\.title){
                            article in
                            
                            HStack{
                                VStack(alignment:.leading){
                                    Text(article.publications)
                                        .foregroundColor(.white)
                                        .font(.custom("Arial", size: 22))
                                        .fontWeight(.bold)
                                    
                                    
                                    Text(article.title)
                                        .foregroundColor(.white)
                                        .font(.custom("Arial", size: 22))
                                    
                                }
                                Spacer()
                                
                                URLImage(url: URL(string: article.imageUrl)!, content: {
                                    $0.resizable()
                                }).frame(width: 100, height: 100)
                            }
                            
                            
                        }
                    }.frame(maxWidth: .infinity)
                }
                

            
        }.frame(width: screenSize.width, height: screenSize.height)
        .background(Color.init(red: 23/255 , green: 33/355, blue: 44/255))
        .cornerRadius(20)
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        
        let article = Article(title: "QWE", publication: "ZXC", imageURL: "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5f2c667737950e6bf2338de1%2F0x0.jpg")
        
        NewsArticleView(newsArticles: [NewsArticleViewModel(article: article)],onDragBegin: {_ in },onDragEnd: {_ in })
    }
}
