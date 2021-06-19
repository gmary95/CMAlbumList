//
//  NetworkService.swift
//  CMAlbumList
//
//  Created by Mary Gerina on 19.06.2021.
//

import Foundation
import Alamofire

class NetworkService {
    
    func getAlbums(url: String) -> DataResponsePublisher<[Album]> {
        AF.request(NetworkConstants.baseURL + url).publishDecodable(type: [Album].self)
    }
    
    func getPhotos(url: String, parameters: [String: String]) -> DataResponsePublisher<[Photo]> {
        AF.request(NetworkConstants.baseURL + url, parameters: parameters).publishDecodable(type: [Photo].self)
    }
    
}
