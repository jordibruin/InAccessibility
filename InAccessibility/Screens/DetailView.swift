//
//  DetailView.swift
//  InAccessibility
//
//  Created by Jordi Bruin on 19/05/2022.
//

import SwiftUI

enum AlertItem: String, Identifiable {
    case share
    case favorite
    
    var id: String { self.rawValue }
}
struct DetailView: View {
    
    let stock: Stock
    @State var selectedAlertItem: AlertItem?
    

    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                companyInfo
                description
                buttons
            }
            .padding(.horizontal)
            
            Text("Detailview")
                .navigationTitle(stock.name)
        }
        .alert(item: $selectedAlertItem, content: { item in
            if item == .share {
                return Alert(title: Text("Thanks for sharing!"))
            } else {
                return Alert(title: Text("Thanks for favoriting (but not really)!"))
            }
        })
    }
    
    var companyInfo: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Company Name")
                    .font(.subheadline)
                Text(stock.name)
                    .font(.system(size: 24))
                    .bold()
                Text(stock.shortName)
                    .font(.system(size: 12))
            }
            
            Spacer()
            StockGraph(stock: stock)
        }
    }
    
    var description: some View {
        VStack(alignment: .leading) {
            Text("Company Description")
                .font(.subheadline)
            Text("This is a company that was founded at some point in time by some people with some ideas. The company makes products and they do other things as well. Some of these things go well, some don't. The company employs people, somewhere between 10 and 250.000. The exact amount is not currently available.")
                .font(.system(size: 22))
        }
    }
    
    var buttons: some View {
        VStack {
            Text("Tap to share")
                .bold()
                .font(.title2)
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color.blue)
                .cornerRadius(15)
                .foregroundColor(.white)
                .onTapGesture {
                    selectedAlertItem = .share
                }
            
            Text("Favorite")
                .bold()
                .font(.title2)
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color.yellow)
                .cornerRadius(15)
                .foregroundColor(.white)
                .onTapGesture {
                    selectedAlertItem = .favorite
                }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(stock: .example())
    }
}
