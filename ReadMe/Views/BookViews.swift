//
//  BookViews.swift
//  ReadMe
//
//  Created by Suppasit beer on 8/10/2565 BE.
//

import SwiftUI

struct TitleAndAuthorStack: View {
    var book: Book
    var titleFont: Font
    var authorFont: Font
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(book.title)
                .font(titleFont)
            Text(book.author)
                .font(authorFont)
                .foregroundColor(.secondary)
        }
    }
}


extension Book {
    struct Image: View {
        let image: SwiftUI.Image?
        var title: String
        var size: CGFloat?
        let cornerRadius: CGFloat
        
        var body: some View {
            if let image = image {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: size, height: size)
                    .cornerRadius(cornerRadius)
            } else {
                let symbol = SwiftUI.Image(title: title) ?? .init(systemName: "book")
                
                symbol
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
                    .font(.title.weight(.light))
                    .foregroundColor(.secondary.opacity(0.5))
            }
        }
    }
}

extension Book.Image {
    /// A preview image
    init(title: String) {
        self.init(image: nil, title: title, cornerRadius: .init())
    }
}

extension Image {
    init?(title: String) {
        guard
            let character = title.first,
            case let symbolName = "\(character.lowercased()).square",
            UIImage(systemName: symbolName) != nil
        else {
            return nil
        }
        
        self.init(systemName: symbolName)
    }
}

//struct Book_Previews: PreviewProvider {
//    static var previews: some View {
//        VStack {
//            Book.Image(title: Book().title, size: 80)
//            Book.Image(title: "", size: 80)
//            Book.Image(title: "📖", size: 80)
//        }
//    }
//}

struct Book_largeImage_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TitleAndAuthorStack(book: .init(), titleFont: .title, authorFont: .title2)
            Book.Image(title: Book().title)
            Book.Image(title: "")
            Book.Image(title: "📖")
        }
    }
}
