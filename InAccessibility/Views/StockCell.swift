//
//  StockCell.swift
//  InAccessibility
//
//  Created by Jordi Bruin on 19/05/2022.
//

import SwiftUI

struct StockCell: View {
    
    let stock: Stock
    
    @State var showInfo = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(stock.shortName)
                        .font(.system(size: 17))
                        .bold()
                    
                    Image("info-icon")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .onTapGesture {
                            showInfo = true
                        }
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .opacity(stock.favorite ? 1 : 0)                        
                }
                Text(stock.name)
                    .opacity(0.5)
                    .font(.system(size: 11))
            }
            
            Spacer()
                
            StockGraph(stock: stock)
            StockPrice(stock: stock)
        }
        .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 8))
        .alert(isPresented: $showInfo) {
            Alert(title: Text(stock.name), message: Text("The stock price for \(stock.name) (\(stock.shortName)) is \(stock.stockPrice)."), dismissButton: .cancel())
        }
    }
}

struct StockCell_Previews: PreviewProvider {
    static var previews: some View {
        StockCell(stock: .example())
    }
}
