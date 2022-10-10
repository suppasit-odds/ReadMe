//
//  NewBookView.swift
//  ReadMe
//
//  Created by Suppasit beer on 10/10/2565 BE.
//

import SwiftUI

struct NewBookView: View {
    @ObservedObject var book = Book(title: "", author: "")
    @State var image: Image? = nil
    @EnvironmentObject var library: Library
    
    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                TextField("Title", text: $book.title)
                TextField("Author", text: $book.author)
                ReviewAndImageStack(book: book, image: $image)
                Spacer()
            }
            .padding()
            .navigationTitle("Got a new book?")
            .toolbar {
                ToolbarItem(placement: .status) {
                    Button("Add to library") {
                        library.addNewBook(book, image: image)
                    }
                }
            }
        }
    }
}

struct NewBookView_Previews: PreviewProvider {
    static var previews: some View {
        NewBookView().environmentObject(Library())
    }
}
