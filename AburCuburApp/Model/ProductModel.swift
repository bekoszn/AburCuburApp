//
//  ProductModel.swift
//  AburCuburApp
//
//  Created by Berke Özgüder on 4.08.2024.
//

import SwiftUI

struct Product: Identifiable {
    var id: UUID = .init()
    var name: String
    var category: String
    var image: String
    var color : Color
    var price: Int
    
}

var productList = [Product(name: "Meyveli", category: "Şeker", image: "toffee1",color: .red, price: 30),
                   Product(name: "Karamel", category: "Şeker", image: "toffee2",color: .red, price: 35),
                   Product(name: "Elegan", category: "Şeker", image: "toffee3",color: .red, price: 40),
                   Product(name: "Kola", category: "Jelibon", image: "jellybean1",color: .red, price: 15),
                   Product(name: "Altın Ayıcık", category: "Jelibon", image: "jellybean2",color: .red, price: 18),
                   Product(name: "Diş", category: "Jelibon", image: "jellybean3",color: .red, price: 20),
                   Product(name: "Şeftali", category: "Jelibon", image: "jellybean4",color: .red, price: 20),
                   Product(name: "Antep Fıstıklı", category: "Çikolata", image: "choco1",color: .red, price: 55),
                   Product(name: "Sütlü", category: "Çikolata", image: "choco2",color: .red, price: 50),
                   Product(name: "Bitter", category: "Çikolata", image: "choco3",color: .red , price: 55),
                   Product(name: "Baklavalı", category: "Çikolata", image: "choco4",color: .red, price: 60),
]
