//
//  DetailView.swift
//  ReadMe
//
//  Created by Suppasit beer on 9/10/2565 BE.
//

import SwiftUI

struct DetailView: View {
    let book: Book
    
    var body: some View {
        BookDetail(book: book)
    }
}

struct BookDetail: View {
    let book: Book
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(book.title)
                .font(.title2.weight(.bold))
            Text(book.author)
                .font(.title3)
                .foregroundColor(.secondary)
            Book.Image(title: book.title, largeImage: true)
            Spacer()
        }
        .padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: .init())
    }
}

