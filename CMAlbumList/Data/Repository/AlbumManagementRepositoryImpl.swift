//
//  AlbumManagementRepository.swift
//  CMAlbumList
//
//  Created by Mary Gerina on 19.06.2021.
//
import Alamofire

final class AlbumManagementRepositoryImpl {
    private let service: AlbumsService
    
    init() {
        service = AlbumsService()
    }
}

extension AlbumManagementRepositoryImpl: AlbumManagementRepository {
    func getAlbums() -> DataResponsePublisher<[Album]> {
        service.get()
    }
}
