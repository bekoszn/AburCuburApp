//
//  CartView.swift
//  AburCuburApp
//
//  Created by Berke Özgüder on 8.08.2024.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        NavigationView {
            
            ZStack {
                Color.yellow.opacity(0.7)
                    .ignoresSafeArea()
                
            ScrollView {
                VStack {
                    HStack {
                        Text("Sepetiniz")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                            Text("\(cartManager.products.count)")
                                .font(.system(size: 35))
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70, height: 90)
                                .background(.red)
                                .clipShape(Capsule())
                        }
                        .foregroundColor(.black)
                        
                        
                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70, height: 90)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                        }
                        .foregroundColor(.black)
                    }
                    .padding(30)
                    
                    VStack (spacing: 20) {
                        ForEach(cartManager.products, id: \.name) { item in
                            CartProductCard(product: item)
                        }
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Gönderim Ücreti")
                            Spacer()
                            Text("Ücretsiz")
                                .font(.system(size: 24, weight: .semibold))
                        }
                        
                        Divider()
                        
                        Text("Toplam Miktar")
                            .font(.system(size: 24))
                        
                        Text("\(cartManager.total) ₺")
                            .font(.system(size: 36, weight: .semibold))
                        
                    }
                    .padding(30)
                    .frame(maxWidth: .infinity)
                    .background(.red)
                    .clipShape(.rect(cornerRadius: 30))
                    .padding()
                    
                    Button {
                        
                    } label: {
                        Text("Ödeme Yap")
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(.red)
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.black)
                            .clipShape(Capsule())
                            .padding()
                    }
                }
                    
                }
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}

struct CartProductCard: View {
    var product: Product
    var body: some View {
        HStack(alignment: .center, spacing:20) {
            

            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 80, height: 80)
                .background(.gray.opacity(0.1))
                .clipShape(Circle())
            
            VStack(alignment: .leading, content : {
                Text("\(product.name)")
                    .font(.headline)
                
                Text(product.category)
                    .font(.callout)
                    .opacity(0.5)
            })
            
            Spacer()
            
            Text("\(product.price)₺")
                .padding()
                .background(.red)
                .clipShape(Capsule())

            
        }
    }
}
