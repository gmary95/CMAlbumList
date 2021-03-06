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
    
    private var spacing: CGFloat = 5
    private var cornerRadius: CGFloat = 5
    private let shadowRadius: CGFloat = 4
    private let padding: CGFloat = 10
    
    private var gridItemLayout = [GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible())]
    
    init(album: Album) {
        self.album = album
        viewModel = PhotoListViewModel(albumId: album.id)
    }
    
    var body: some View {
        RefreshableScrollView(refreshing: self.$viewModel.loading) {
            LazyVGrid(columns: gridItemLayout, spacing: spacing) {
                ForEach(viewModel.photoArr) { photo in
                    PhotoCell(photo: photo)
                        .cornerRadius(cornerRadius)
                        .shadow(radius: shadowRadius)
                }
            }
            .padding(padding)
        }
        .alert(isPresented: self.$viewModel.isPresentingAlert) {
            Alert(title: Text(LocalizedStrings.errorTitle),
                  message: Text(LocalizedStrings.errorText),
                  dismissButton: .default(Text(LocalizedStrings.okButton)))
        }
        .navigationBarTitle(album.title, displayMode: .automatic)
    }
}


#if DEBUG
struct  PhotoListView_Preview: PreviewProvider {
    static var previews: some View {
        PhotoListView(album: albumTestData)
    }
}
#endif
