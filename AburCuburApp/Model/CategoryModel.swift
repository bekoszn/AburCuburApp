//
//  CategoryModel.swift
//  Aburcubur App
//
//  Created by Berke Özgüder on 4.08.2024.
//

import SwiftUI

struct CategoryModel: Identifiable, Hashable {
    var id: UUID = .init()
    var icon: String
    var title: String
    
}

var categoryList: [CategoryModel] = [
    CategoryModel(icon: "", title: "Tümü"),
    CategoryModel(icon: "choco", title: "Çikolata"),
    CategoryModel(icon: "toffee", title: "Şeker"),
    CategoryModel(icon: "jellybean", title: "Jelibon"),
]
