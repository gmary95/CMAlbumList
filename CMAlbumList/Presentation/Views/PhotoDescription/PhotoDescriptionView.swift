//
//  PhotoDescriptionView.swift
//  CMAlbumList
//
//  Created by Mary Gerina on 19.06.2021.
//

import SwiftUI

struct PhotoDescriptionView: View {
    @State var show = false
    
    var photo: Photo?
    
    var body: some View {
        VStack {
            ImageFromUrl(url: photo?.url ?? "") // if you need to download an image on a slow internet you might want to consider a partial download
                .aspectRatio(contentMode: .fill)
                .clipShape(Rectangle())
                .overlay(
                    Rectangle()
                        .foregroundColor(.clear)
                )
                .onTapGesture {
                    withAnimation(.spring()) {
                        show.toggle()
                    }
                }
            if show {
                TextDescriptionView(photo: photo)
            }
        }.navigationBarTitle(Text(photo?.title ?? ""), displayMode: .automatic)
    }
}


#if DEBUG
struct PhotoDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDescriptionView(photo: photoTestData)
    }
}
#endif

