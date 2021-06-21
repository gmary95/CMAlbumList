//
//  AlbumListViewModel.swift
//  CMAlbumList
//
//  Created by Mary Gerina on 19.06.2021.
//

import Foundation
import Combine
import SwiftUI

final class AlbumListViewModel: ObservableObject {
    @Published var albumArr: [Album] = []
    @Published var isPresentingAlert = false
    @Published var loading: Bool = false {
        didSet {
            if oldValue == false && loading == true {
                self.fetch()
            }
        }
    }
    
    
    private var cancellation: AnyCancellable?
    private let usecase = AlbumManagmentUseCase()
    
    init() {
        self.fetch()
    }
    
    func fetch() {
        cancellation = usecase.fetch()
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] response in
                    switch response.result {
                    case .success(let albumArr):
                        self?.albumArr = albumArr
                        self?.loading = false
                    case .failure(let error):
                        print(error.localizedDescription)
                        self?.isPresentingAlert = true
                        self?.loading = false
                    }
                  })
    }
}
