//
//  NewListViewModel.swift
//  SwiftUINewsApp
//
//  Created by yangjs on 2023/06/28.
//

import Foundation

class NewsListViewModel : ObservableObject {
    @Published var newsList : [News] = []
    var pageSize = 10
    var currentPage = 1
    var start : Int {
        pageSize * (currentPage-1) + 1
    }
    private var selectedKeyword : String
    
    
    init() {
        self.selectedKeyword = ""
    }
    
    @MainActor func searchKWDSubmitted(keyword: String) {
        self.newsList = []
        self.selectedKeyword = keyword
        fetchNews()
        
    }
    
    
    @MainActor
    func fetchNews() {
        
        Task {
            newsList += await NewsSerchService().searchNews(
                requestModel: NewsRequestModel(
                    start:start ,
                    display: pageSize,
                    query: self.selectedKeyword
                )
            )
            print(newsList)
        }
    }
    
    @MainActor func loadNextPage(_ current : News) {
        if current == newsList[newsList.count - 3]{
            currentPage += 1
            fetchNews()
        }
        
    }
    
}
