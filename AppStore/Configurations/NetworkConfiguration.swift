//
//  NetworkConfiguration.swift
//  AppStore
//
//  Created by Yevhenii Korsun on 02.10.2022.
//

import Foundation

enum NetworkConfiguration {
    private enum APIKeys {
        static let weatherAPIKey = "935816ca51975865a24c12784fe691a1"
    }
    
    enum Urls {
        static func searchUrl(searchText: String) -> URL? {
            return  URL(string: "https://itunes.apple.com/search?term=\(searchText.escaped())&country=us&entity=software")
        }
    }
}

fileprivate extension String {
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
