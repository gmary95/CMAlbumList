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
    @Published var isPresentingAlert = false
    @Published var loading: Bool = false {
        didSet {
            if oldValue == false && loading == true {
                self.fetch()
            }
        }
    }
    
    private var cancellation: AnyCancellable?
    private let usecase: PhotoManagmentUseCase
    
    init() {
        usecase = PhotoManagmentUseCase(albumId: nil)
    }
    
    init(albumId: Int) {
        usecase = PhotoManagmentUseCase(albumId: albumId)
        fetch()
    }
    
    func fetch() {
        cancellation = usecase.fetch()
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] response in
                    switch response.result {
                    case .success(let albumArr):
                        self?.photoArr = albumArr
                        self?.loading = false
                    case .failure(let error):
                        print(error.localizedDescription)
                        self?.isPresentingAlert = true
                        self?.loading = false
                    }
                  })
    }
}
