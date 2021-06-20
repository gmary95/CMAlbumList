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
    private let usecase: PhotoManagmentUseCase
    
    init() {
        usecase = PhotoManagmentUseCase(albumId: nil)
    }
    
    init(albumId: Int) {
        usecase = PhotoManagmentUseCase(albumId: albumId)
        fetchPhoto()
    }
    
    func fetchPhoto() {
        cancellation = usecase.fetch()
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
