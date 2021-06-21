//
//  AlbumCell.swift
//  CMAlbumList
//
//  Created by Mary Gerina on 19.06.2021.
//

import SwiftUI

struct AlbumCell : View {
    let album: Album
    
    private let height: CGFloat = 220
    private let padding: CGFloat = 10
    
    var body: some View {
        return NavigationLink(destination: PhotoListView(album: album)) {
            VStack(alignment: .leading) {
                Rectangle()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [.darkGradient, .lightGradient]), startPoint: .bottom, endPoint: .topLeading)
                        )
                    .overlay(
                        Text(album.title)
                            .foregroundColor(.textPrimary)
                            .padding(padding)
                    )
                    .frame(height: height)
            }
        }
    }
}

struct AlbumCell_Previews: PreviewProvider {
    static var previews: some View {
        AlbumCell(album: albumTestData)
    }
}
