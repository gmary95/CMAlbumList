//
//  NetworkEndpoint.swift
//  CMAlbumList
//
//  Created by Mary Gerina on 20.06.2021.
//

public protocol Endpoint {
    var path: String {get}
}

public enum AlbumsEndpoint: Endpoint {
    
    case GetAlbums
    
    public var path: String {
        switch self {
        case .GetAlbums: return "/albums"
        }
    }
}

public enum PhotosEndpoint: Endpoint {
    
    case GetPhotos
    
    public var path: String {
        switch self {
        case .GetPhotos: return "/photos"
        }
    }
}
