//
//  NewsSearchService.swift
//  SwiftUINewsApp
//
//  Created by yangjs on 2023/06/28.
//

import Foundation
struct NewsSerchService {
    
    func searchNews(
        requestModel : NewsRequestModel
    ) async -> [News] {
        let baseURL = "https://openapi.naver.com/v1/search/news.json"
        let query = "?query=\(requestModel.query)&display=\(requestModel.display)&start=\(requestModel.start)&sort=date"
        let encodedString = (baseURL + query).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: encodedString!)!
        print(url)
        var request = URLRequest(url: url)
        request.addValue("I7QvMaP2n_gcNH0IcseZ", forHTTPHeaderField: "X-Naver-Client-Id")
        request.addValue("CM1yBgBQyq", forHTTPHeaderField: "X-Naver-Client-Secret")

        do {
            let responseData = try await URLSession.shared.data(for: request)
            let newsList = try JSONDecoder().decode(NewsResponseModel.self, from: responseData.0)
            print("뉴스가져오기 성공")
            return newsList.items
        } catch {
            print(error.localizedDescription)
            return [News]()
        }
    }
    
}
