//
//  DetailView.swift
//  ReadMe
//
//  Created by Suppasit beer on 9/10/2565 BE.
//

import class PhotosUI.PHPickerViewController
import SwiftUI

struct DetailView: View {
    @ObservedObject var book: Book
    @Binding var image: Image?
    @State private var showingImagePicker = false
    @State private var showingDialog = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 16.0) {
                Button {
                    book.readMe.toggle()
                } label: {
                    Image(systemName: book.readMe ? "bookmark.fill" : "bookmark")
                        .font(.system(size: 48, weight: .light))
                }

                TitleAndAuthorStack(book: book, titleFont: .title, authorFont: .title2)
            }
            VStack {
                Divider()
                    .padding(.vertical)
                TextField("Review...", text: $book.microReview)
                    .padding()
                Divider()
                    .padding(.vertical)
                Book.Image(image: image, title: book.title, cornerRadius: 16)
                    .scaledToFit()
                
                HStack {
                    if image != nil {
                        Spacer()
                        Button("Delete Image") {
                            showingDialog = true
                        }
                    }
                    Spacer()
                    Button("Update Image...") {
                       showingImagePicker = true
                    }
                    Spacer()
                }
                .padding()
            }
            Spacer()
        }
        .padding()
        .sheet(isPresented: $showingImagePicker) {
            PHPickerViewController.View(image: $image)
        }
        .confirmationDialog(
            "Delete image for \(book.title)?",
            isPresented: $showingDialog) {
                Button("Delete", role: .destructive) { image = nil }
            } message: {
                Text("Delete image for \(book.title)?")
            }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: .init(), image: .constant(nil))
            .previewedInAllColorSchemes
    }
}

