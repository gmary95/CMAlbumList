//
//  Album.swift
//  CMAlbumList
//
//  Created by Mary Gerina on 19.06.2021.
//

struct Album: Codable, Identifiable {
    var userId: Int
    var id: Int
    var title: String
}

#if DEBUG
let albumTestData = Album(userId: 1, id: 1, title: "quidem molestiae enim")
#endif

