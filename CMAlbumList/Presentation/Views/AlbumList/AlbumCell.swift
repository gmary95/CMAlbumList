//
//  AlbumCell.swift
//  CMAlbumList
//
//  Created by Mary Gerina on 19.06.2021.
//

import SwiftUI

struct AlbumCell : View {
    let album: Album
    
    var body: some View {
        return NavigationLink(destination: PhotoListView(album: album)) {
            VStack(alignment: .leading) {
                Text(album.title)
                    .foregroundColor(.textPrimary)
            }
        }
    }
}

struct AlbumCell_Previews: PreviewProvider {
    static var previews: some View {
        AlbumCell(album: albumTestData)
    }
}
