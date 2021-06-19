//
//  AlbumListViewModel.swift
//  CMAlbumList
//
//  Created by Mary Gerina on 19.06.2021.
//

import Foundation
import Combine

final class AlbumListViewModel: ObservableObject {
    @Published var albumArr: [Album] = []
    
    private var cancellation: AnyCancellable?
    private let usecase = AlbumManagmentUseCase()
        
        init() {
            fetchVideo()
        }
        
        func fetchVideo() {
            cancellation = usecase.fetch()
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] response in
                    switch response.result {
                    case .success(let albumArr):
                        self?.albumArr = albumArr
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
            })
        }
}
