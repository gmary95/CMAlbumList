//
//  PhotoCell.swift
//  CMAlbumList
//
//  Created by Mary Gerina on 19.06.2021.
//

import SwiftUI

struct PhotoCell : View {
    let photo: Photo
    
    private let imageSize: CGFloat = 100
    
    var body: some View {
        return NavigationLink(destination: PhotoDescriptionView(photo: photo)) {
            VStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.clear)
                    .aspectRatio(1, contentMode: .fill)
                    .overlay(
                        ImageFromUrl(url: photo.thumbnailUrl)
                            .scaledToFill()
                    )
                    .clipped()
            }
        }
    }
}

struct PhotoCell_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCell(photo: photoTestData)
    }
}
