//
//  PhotoManagementRepositoryImpl.swift
//  CMAlbumList
//
//  Created by Mary Gerina on 19.06.2021.
//

import Alamofire

final class PhotoManagementRepositoryImpl {
    private let service: PhotosService
    
    init(albumId: String) {
        service = PhotosService(albumId: albumId)
    }
}

extension PhotoManagementRepositoryImpl: PhotoManagementRepository {
    func getPhotos() -> DataResponsePublisher<[Photo]> {
        service.get()
    }
}
