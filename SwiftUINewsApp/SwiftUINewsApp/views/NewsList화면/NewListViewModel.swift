//
//  NewListViewModel.swift
//  SwiftUINewsApp
//
//  Created by yangjs on 2023/06/28.
//

import Foundation
class NewsListViewModel : ObservableObject {
    @Published var newsList : [NewsItem] = []
    var pageSize = 10
    var currentPage = 1
    
    private var selectedKeyword : String
    
    
    init() {
        self.selectedKeyword = ""
    }
    
    func searchKWDSubmitted(keyword: String)  {
        self.newsList = []
        self.selectedKeyword = keyword
        fetchNews()
        
    }
    
    func fetchNews()  {
        Task{
            let resultList = await NewsSerchService().searchNews(
                requestModel: NewsRequestModel(
                    start: self.newsList.count + 1 ,
                    display: pageSize,
                    query: self.selectedKeyword
                )
                
            )
            await MainActor.run {
                self.newsList += resultList
            }
        }
        
        
    }
    
    func loadNextPage()  {
        currentPage += 1
        fetchNews()
    }
    
}
