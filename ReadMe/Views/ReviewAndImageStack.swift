//
//  ReviewAndImageStack.swift
//  ReadMe
//
//  Created by Suppasit beer on 10/10/2565 BE.
//

import class PhotosUI.PHPickerViewController
import SwiftUI

struct ReviewAndImageStack: View {
    @ObservedObject var book: Book
    @Binding var image: Image?
    @State var showingImagePicker = false
    @State var showingDialog = false
    
    var body: some View {
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

struct ReviewAndImageStack_Previews: PreviewProvider {
    static var previews: some View {
        ReviewAndImageStack(book: .init(), image: .constant(nil))
            .padding(.horizontal)
            .previewedInAllColorSchemes
    }
}
