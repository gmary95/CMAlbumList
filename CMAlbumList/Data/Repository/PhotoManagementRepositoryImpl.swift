//
//  PhotoManagementRepositoryImpl.swift
//  CMAlbumList
//
//  Created by Mary Gerina on 19.06.2021.
//

import Alamofire

final class PhotoManagementRepositoryImpl {
    private let service = NetworkService()
}

extension PhotoManagementRepositoryImpl: PhotoManagementRepository {
    func getPhotos(url: String, parameters: [String: String]) -> DataResponsePublisher<[Photo]> {
        service.getPhotos(url: url, parameters: parameters)
    }
}
