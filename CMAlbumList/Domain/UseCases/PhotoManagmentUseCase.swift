//
//  PhotoManagmentUseCase.swift
//  CMAlbumList
//
//  Created by Mary Gerina on 19.06.2021.
//

import Foundation
import Alamofire

final class PhotoManagmentUseCase {
    private let repository: PhotoManagementRepository
    
    init(albumId: Int?) {
        self.repository = PhotoManagementRepositoryImpl(albumId: albumId?.description ?? "")
    }
    
    func fetch() -> DataResponsePublisher<[Photo]> {
        return repository.getPhotos()
    }
}
