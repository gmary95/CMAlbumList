//
//  AlbumManagementRepository.swift
//  CMAlbumList
//
//  Created by Mary Gerina on 19.06.2021.
//
import Alamofire

final class AlbumManagementRepositoryImpl {
    private let service = NetworkService()
}

extension AlbumManagementRepositoryImpl: AlbumManagementRepository {
    func getAlbums(url: String) -> DataResponsePublisher<[Album]> {
        service.getAlbums(url: url)
    }
}
