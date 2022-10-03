//
//  NetworkService.swift
//  AppStore
//
//  Created by Yevhenii Korsun on 02.10.2022.
//

import Foundation

enum APIKeys {
    static let weatherAPIKey = "935816ca51975865a24c12784fe691a1"
}

enum HttpMethod: String {
    case get = "GET" //  запрашиваем содержимое ресурса
    case head = "HEAD" // что и GET, но возвращает только стартовую строку и заголовки
    case post = "POST" // создает новый ресурс из данных
    case put = "PUT" // меняет содержимое по указанному URL
    case delete = "DELETE" // удаляет ресурс по указанному URL
}

struct Resource<T> {
    let url: URL
    var httpMethod: HttpMethod = .get
    let parse: (Data) -> T?
}

final class NetworkService {
    func load<T>(resource: Resource<T>, completion: @escaping(T?) -> Void) {
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        //        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, responce, error in
            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
    
    func search(text: String, completion: @escaping(SearchResult) -> Void) {
        if let url = NetworkConfiguration.Urls.searchUrl(searchText: text) {
            let resource = Resource<SearchResult>(url: url) { data in
                return try? JSONDecoder().decode(SearchResult.self, from: data)
            }
            
            NetworkService().load(resource: resource) { result in
                if let responce = result {
                    //            let viewModel = WeatherViewModel(weather: weatherResource)
                    completion(responce)
                }
            }
        }
    }
}
