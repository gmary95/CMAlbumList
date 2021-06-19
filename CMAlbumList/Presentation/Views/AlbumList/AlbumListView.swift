//
//  ContentView.swift
//  CMAlbumList
//
//  Created by Mary Gerina on 19.06.2021.
//

import SwiftUI

struct AlbumListView: View {
    @ObservedObject var viewModel = AlbumListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.albumArr) { album in
                AlbumCell(album: album)
            }
            .navigationBarTitle(Text(LocalizedStrings.mainTittle), displayMode: .inline)
            .foregroundColor(.textPrimary)
        }
    }
}


#if DEBUG
struct  AlbumListView_Preview: PreviewProvider {
    static var previews: some View {
        AlbumListView()
    }
}
#endif
