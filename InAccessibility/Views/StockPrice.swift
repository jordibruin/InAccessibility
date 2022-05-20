//
//  StockPrice.swift
//  InAccessibility
//
//  Created by Jordi Bruin on 19/05/2022.
//

import SwiftUI

struct StockPrice: View {
    
    let stock: Stock
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 2) {
            Text("\(String(format: "%.2f",stock.stockPrice))")
            
            Text("\(String(format: "%.2f",stock.change))")
            
                .bold()
                .font(.caption)
                .padding(4)
                .background(stock.goingUp ? Color.green : Color.red)
                .cornerRadius(6)
                .foregroundColor(.white)
        }
    }
}


struct StockPrice_Previews: PreviewProvider {
    static var previews: some View {
        StockPrice(stock: .example())
    }
}
