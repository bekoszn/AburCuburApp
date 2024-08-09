//
//  ContentView.swift
//  AburCuburApp
//
//  Created by Berke Özgüder on 4.08.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var cartManager = CartManager()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                Home()
                    .environmentObject(cartManager)
                
                if cartManager.products.count > 0 {
                    NavigationLink(destination: CartView().environmentObject(cartManager)) {
                        HStack(spacing: 30) {
                            Text("\(cartManager.products.count)")
                                .padding()
                                .background(.yellow)
                                .clipShape(Circle())
                                .foregroundColor(.black)
                            VStack(alignment: .leading) {
                                Text("Sepet")
                                    .font(.system(size: 26, weight: .semibold))
                                
                                Text("\(cartManager.products.count) Ürün")
                                    .font(.system(size: 18))
                            }
                            
                            Spacer()
                            
                            
                            
                            
                            ForEach(cartManager.products, id: \.name) { product in
                                
                                Image(product.image)
                                    .resizable()
                                    .scaledToFit()
                                    .padding(8)
                                    .frame(width: 40, height: 40)
                                    .background(.white)
                                    .clipShape(Circle())
                                    .padding(.leading, -60)
                            }
                        }
                        .padding(30)
                        .frame(width: .infinity, height: 100)
                        .background(.red)
                        .clipShape(.rect(topLeadingRadius: 60, topTrailingRadius: 30))
                        .foregroundColor(.white)

                    }

                }

                    }
                    
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}


#Preview {
    ContentView()
}
