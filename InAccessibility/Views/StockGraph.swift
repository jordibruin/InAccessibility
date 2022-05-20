//
//  StockGraph.swift
//  InAccessibility
//
//  Created by Jordi Bruin on 19/05/2022.
//

import SwiftUI

struct StockGraph: View {
    
    let stock: Stock
    
    let points: [Int] = [10, 20, 30, 40, 30,25,44]
    
    @State var bigCircles = true
    @State var showDots = false
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.9)
                .cornerRadius(7)
                .frame(width: 100, height: 50)
            
            HStack(spacing: bigCircles ? 2 : 8) {
                ForEach(points, id: \.self) { point in
                    Circle()
                        .frame(width: bigCircles ? 10 : 4, height: bigCircles ? 10 : 4)
                        .foregroundColor(stock.goingUp ? .green : .red)
                        .offset(y: CGFloat(stock.goingUp ? -point : point) * 0.3)
                }
            }
            .opacity(showDots ? 1 : 0)
            .offset(y: showDots ? 0 : 12)
            .animation(.default, value: showDots)
        }
        .onAppear {
            showDots = true
            bigCircles.toggle()
        }
        .onTapGesture {
            withAnimation(.spring()) {
                bigCircles.toggle()
            }
        }
    }
}

struct StockGraph_Previews: PreviewProvider {
    static var previews: some View {
        StockGraph(stock: .example())
    }
}
