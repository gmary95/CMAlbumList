//
//  PhotoCell.swift
//  CMAlbumList
//
//  Created by Mary Gerina on 19.06.2021.
//

import SwiftUI

struct PhotoCell : View {
    let photo: Photo
    
    var body: some View {
        return NavigationLink(destination: PhotoDescriptionView(photo: photo)) {
            VStack(alignment: .leading) {
                Text(photo.title)
                    .foregroundColor(.textPrimary)
            }
        }
    }
}

struct PhotoCell_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCell(photo: photoTestData)
    }
}
