//
//  PhotoListViewModel.swift
//  CMAlbumList
//
//  Created by Mary Gerina on 19.06.2021.
//

import Foundation

import Combine

final class PhotoListViewModel: ObservableObject {
    @Published var photoArr: [Photo] = []
    
    private var cancellation: AnyCancellable?
    private let usecase = PhotoManagmentUseCase()
    
    init() {
        fetchPhoto(albumId: nil)
    }
    
    init(albumId: Int) {
        fetchPhoto(albumId: albumId)
    }
    
    func fetchPhoto(albumId: Int?) {
        cancellation = usecase.fetch(albumId: albumId)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] response in
                    switch response.result {
                    case .success(let albumArr):
                        self?.photoArr = albumArr
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                  })
    }
}
