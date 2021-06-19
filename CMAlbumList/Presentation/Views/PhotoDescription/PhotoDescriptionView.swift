//
//  PhotoDescriptionView.swift
//  CMAlbumList
//
//  Created by Mary Gerina on 19.06.2021.
//

import SwiftUI

struct PhotoDescriptionView: View {
    var photo: Photo?
    
    private let imageSize: CGFloat = 200
    private let radius: CGFloat = 10
    private let lineWidth: CGFloat = 4
    private let lineLimit = 50
    
    var body: some View {
        VStack {
            ImageFromUrl(url: photo?.url ?? "")
                .frame(width: imageSize, height: imageSize)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.strokeColor, lineWidth: lineWidth)
                )
                .shadow(radius: radius)
            Text(photo?.title ?? "")
                .font(.title)
                .foregroundColor(.textPrimary)
            Divider()
            Text(photo?.url ?? "")
                .font(.headline)
                .multilineTextAlignment(.center)
                .lineLimit(lineLimit)
                .foregroundColor(.textSecondary)
        }.padding().navigationBarTitle(Text(photo?.title ?? ""), displayMode: .automatic)
    }
}


#if DEBUG
struct PhotoDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDescriptionView(photo: photoTestData)
    }
}
#endif

