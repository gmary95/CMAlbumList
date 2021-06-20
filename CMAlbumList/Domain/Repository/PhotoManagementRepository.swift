//
//  PhotoManagementRepository.swift
//  CMAlbumList
//
//  Created by Mary Gerina on 19.06.2021.
//

import Alamofire

protocol PhotoManagementRepository {
    func getPhotos() -> DataResponsePublisher<[Photo]>
}
