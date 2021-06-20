//
//  AlbumManagmentUseCase.swift
//  CMAlbumList
//
//  Created by Mary Gerina on 19.06.2021.
//

import Alamofire

final class AlbumManagmentUseCase {
    private let repository: AlbumManagementRepository
    
    init() {
        self.repository = AlbumManagementRepositoryImpl()
    }
    
    func fetch() -> DataResponsePublisher<[Album]> {
        repository.getAlbums()
    }
}
