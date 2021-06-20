//
//  NetworkTask.swift
//  CMAlbumList
//
//  Created by Mary Gerina on 20.06.2021.
//

public typealias Parameters = [String:Any]

protocol RequestProtocol {
    var path: String { get }
    var parameters: Parameters? { get }
}

struct GetAlbumsRequest: RequestProtocol {
    var path: String
    var parameters: Parameters?
    
    init() {
        self.path = AlbumsEndpoint.GetAlbums.path
        self.parameters = nil
    }
}

struct GetPhotosRequest: RequestProtocol {
    var path: String
    var parameters: Parameters?
    
    init(albumId: String) {
        self.path = PhotosEndpoint.GetPhotos.path
        self.parameters = ["albumId": albumId]
    }
}
