//
//  Book.swift
//  ReadMe
//
//  Created by Suppasit beer on 8/10/2565 BE.
//

struct Book: Hashable {
    let title: String
    let author: String
    
    init(title: String = "Title", author: String = "Author") {
        self.title = title
        self.author = author
    }
}
