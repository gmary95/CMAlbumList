//
//  AlbumManagementRepository.swift
//  CMAlbumList
//
//  Created by Mary Gerina on 19.06.2021.
//
import Alamofire

protocol AlbumManagementRepository {
    func getAlbums(url: String) -> DataResponsePublisher<[Album]>
}
