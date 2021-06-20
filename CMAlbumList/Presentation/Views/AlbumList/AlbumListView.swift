//
//  AlbumListView.swift
//  CMAlbumList
//
//  Created by Mary Gerina on 19.06.2021.
//

import SwiftUI

struct AlbumListView: View {
    @ObservedObject var viewModel = AlbumListViewModel()
    
    private var spacing: CGFloat = 5
    private var cornerRadius: CGFloat = 5
    private let shadowRadius: CGFloat = 4
    private let padding: CGFloat = 10
    
    private var gridItemLayout = [GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItemLayout, spacing: spacing) {
                    ForEach(viewModel.albumArr) { album in
                        AlbumCell(album: album)
                            .cornerRadius(cornerRadius)
                            .shadow(radius: shadowRadius)
                            .animation(.default)
                    }
                }
                .padding(padding)
            }
            .animation(.default)
            .navigationBarTitle(Text(LocalizedStrings.mainTittle), displayMode: .inline)
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
