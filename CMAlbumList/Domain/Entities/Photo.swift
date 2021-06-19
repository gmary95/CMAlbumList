//
//  Photo.swift
//  CMAlbumList
//
//  Created by Mary Gerina on 19.06.2021.
//

struct Photo: Codable, Identifiable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}

#if DEBUG
let photoTestData = Photo(albumId: 1, id: 1, title: "accusamus beatae ad facilis cum similique qui sunt", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/150/92c952")
#endif
