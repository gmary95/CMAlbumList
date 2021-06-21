//
//  NetworkService.swift
//  CMAlbumList
//
//  Created by Mary Gerina on 19.06.2021.
//

import Foundation
import Alamofire

protocol NetworkService {
    associatedtype T
    var request: RequestProtocol { get }
    
    func get() -> DataResponsePublisher<[T]>
}

class AlbumsService: NetworkService {
    var request: RequestProtocol
    
    init() {
        self.request = GetAlbumsRequest()
    }
    
    func get() -> DataResponsePublisher<[Album]> {
        AF.request(NetworkConstants.baseURL
                    + request.path).publishDecodable(type: [Album].self)
    }
}

class PhotosService: NetworkService {
    var request: RequestProtocol
    
    init(albumId: String) {
        self.request = GetPhotosRequest(albumId: albumId)
    }
    
    func get() -> DataResponsePublisher<[Photo]> {
        AF.request(NetworkConstants.baseURL + request.path, parameters: request.parameters).publishDecodable(type: [Photo].self)
    }
}

