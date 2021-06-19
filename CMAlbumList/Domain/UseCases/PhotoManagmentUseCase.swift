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
    
    init() {
        self.repository = PhotoManagementRepositoryImpl()
    }
    
    func fetch(albumId: Int?) -> DataResponsePublisher<[Photo]> {
        let queryParams: [String: String] = [
            "albumId": albumId?.description ?? ""
        ]
        return repository.getPhotos(url: "/photos", parameters: queryParams)
    }
}
