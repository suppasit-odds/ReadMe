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
        VStack {
            Book.Image(title: book.title)
            Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: .init())
    }
}
