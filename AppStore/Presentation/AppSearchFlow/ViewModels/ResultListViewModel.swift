//
//  ResultViewMode.swift
//  AppStore
//
//  Created by Yevhenii Korsun on 02.10.2022.
//

import Foundation

class ResultListViewModel {
    private var networkService: NetworkService
    private var results = [ResultViewModel]()
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    var isLabelHidden: Bool {
        !results.isEmpty
    }
    
    func modelBy(indexPath: IndexPath) -> ResultViewModel {
        results[indexPath.row]
    }
    
    func numberOfRowIn(section: Int) -> Int {
        return results.count
    }
    
    func search(text: String, completion: @escaping () -> Void) {
        networkService.search(text: text) { results in
            self.results = results.results.map(ResultViewModel.init)
            completion()
        }
    }
}

struct ResultViewModel: Identifiable {
    var id: UUID
    private var result: Result
    
    init(result: Result) {
        self.result = result
        id = UUID()
    }
    
    var name: String {
        result.trackName
    }
    
    var category: String {
        result.primaryGenreName
    }
    
    var rating: String {
        String(format: "%.2f",  result.averageUserRating ?? 0)
    }
    
    var iconImageUrl: URL? {
        URL(string: result.artworkUrl100)
    }
    
    var previewImagesUrl: [URL] {
        result.screenshotUrls.compactMap { URL(string: $0) }
    }
}
