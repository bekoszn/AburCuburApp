//
//  Home.swift
//  Aburcubur App
//
//  Created by Berke Özgüder on 4.08.2024.
//

import SwiftUI

struct Home: View {
    
    @State var selectedCategory = "Çikolata"
    
    @EnvironmentObject var cartManager : CartManager
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.yellow.opacity(0.7)
                    .ignoresSafeArea()
                ScrollView {
                    VStack {
                        HStack {
                            Text("En Güzel **Aburcuburlardan** Alın")
                                .font(.system(size: 28))
                                .padding(.trailing)
                            
                            Spacer()
                            
                            NavigationLink {
                                CartView()
                            } label: {
                                Image(systemName: "line.3.horizontal")
                                    .imageScale(.large)
                                    .padding()
                                    .frame(width: 70, height: 90)
                                    .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                            }
                            .foregroundColor(.black)
                        }
                        .padding(30)
                        
                        CategoryListView
                        
                        HStack {
                            Text("**Tümünü Gör**")
                                .font(.system(size: 24))
                            
                            Spacer()
                            
                            NavigationLink {
                                CollectionView()
                            } label: {
                                Image(systemName: "arrow.right")
                                    .imageScale(.large)
                                    .foregroundColor(.red)
                            }
                            .foregroundColor(.red)
                            
                            
                            
                        }
                        .padding(.horizontal, 30)
                        .padding(.vertical, 15)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(productList.filter { $0.category == selectedCategory || selectedCategory == "Tümü" }, id: \.id) { item in
                                    ProductCard(product: item)
                                }
                            }
                        }
                        
                        
                    }
                }
            }
        }
    }
        
        
        var CategoryListView: some View {
            HStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(categoryList, id: \.id) { item in
                            Button {
                                selectedCategory = item.title
                                
                            } label: {
                                HStack {
                                    if item.title != "Tümü" {
                                        Image(item.icon)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(selectedCategory == item.title ? .yellow : .black)
                                            .frame(width: 20, height: 10)
                                    }
                                    
                                    Text(item.title)
                                }
                                .padding(20)
                                .background(selectedCategory == item.title ? .red : .gray.opacity(0.1))
                                .foregroundColor(selectedCategory != item.title ? .black : .white)
                                .clipShape(Capsule())
                                
                            }
                        }
                    }
                    .padding(.horizontal, 30)
                }
            }
        }
    }
    
    #Preview {
        Home()
            .environmentObject(CartManager())
    }
    
    
    struct ProductCard: View {
        
        @EnvironmentObject var cartManager: CartManager
        
        
        var product: Product
        var body: some View {
            ZStack {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .padding(.trailing, -200)
                    .rotationEffect(Angle(degrees: 30))
                
                
                
                
                
                ZStack {
                    VStack(alignment: .leading, content: {
                        Text("\(product.name)")
                            .font(.system(size: 34, weight: .semibold))
                            .frame(width: 140)
                        
                        Text(product.category)
                            .font(.callout)
                            .padding()
                            .background(.white.opacity(0.5))
                            .clipShape(Capsule())
                        
                        Spacer()
                        
                        HStack {
                            Text("\(product.price)₺")
                                .font(.system(size: 24, weight: .semibold))
                            
                            Spacer()
                            
                            Button {
                                cartManager.addToCart(product: product)
                                
                            } label: {
                                Image(systemName: "basket")
                                    .imageScale(.large)
                                    .padding()
                                    .frame(width: 80, height: 60)
                                    .background(.black)
                                    .clipShape(Capsule())
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal, -15)
                        }
                        
                        .padding(.leading)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 80)
                        .background(.white.opacity(0.8))
                        .clipShape(Capsule())
                    })
                    
                }
                .padding(30)
                .frame(width: 336, height: 422)
            }
            .frame(width: 336, height: 422)
            .background(product.color)
            .clipShape(.rect(cornerRadius: 57))
            .padding(.leading, 20)
        }
    }

