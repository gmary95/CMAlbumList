//
//  PhotoListView.swift
//  CMAlbumList
//
//  Created by Mary Gerina on 19.06.2021.
//

import SwiftUI

struct PhotoListView: View {
    @ObservedObject var viewModel:  PhotoListViewModel
    
    var album: Album
    
    init(album: Album) {
        self.album = album
        viewModel = PhotoListViewModel(albumId: album.id)
    }
    
    var body: some View {
            List(viewModel.photoArr) { photo in
                PhotoCell(photo: photo)
            .navigationBarTitle(album.title, displayMode: .automatic)
            .foregroundColor(.textPrimary)
        }
    }
}


#if DEBUG
struct  PhotoListView_Preview: PreviewProvider {
    static var previews: some View {
        PhotoListView(album: albumTestData)
    }
}
#endif
