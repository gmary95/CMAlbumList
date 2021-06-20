//
//  TextDescriptionView.swift
//  CMAlbumList
//
//  Created by Mary Gerina on 20.06.2021.
//

import SwiftUI

struct TextDescriptionView: View {
    var photo: Photo?
    
    private let lineLimit = 50
    
    var body: some View {
        HStack {
            VStack {
                Text(photo?.title ?? "")
                    .font(.title)
                    .foregroundColor(.textPrimary)
                Divider()
                Text(photo?.url ?? "")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .lineLimit(lineLimit)
                    .foregroundColor(.textSecondary)
            }
        }
    }
}


#if DEBUG
struct TextDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        TextDescriptionView(photo: photoTestData)
    }
}
#endif



