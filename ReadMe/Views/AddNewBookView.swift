//
//  NewBookView.swift
//  ReadMe
//
//  Created by Suppasit beer on 10/10/2565 BE.
//

import SwiftUI

struct NewBookView: View {
    @ObservedObject var book: Book
    @Binding var image: Image?
    @State var showingImagePicker = false
    @State var showingDialog = false
    
    var body: some View {
        VStack {
            TextField("Title", text: $book.title)
                .font(.title2)
                .foregroundColor(.secondary)
            TextField("Author", text: $book.author)
                .font(.title2)
                .foregroundColor(.secondary)
            BookInfo(
                book: book,
                image: $image
            )
            Spacer()
        }
        .padding()
    }
}

struct NewBookView_Previews: PreviewProvider {
    static var previews: some View {
        NewBookView(book: .init(), image: .constant(nil))
    }
}
