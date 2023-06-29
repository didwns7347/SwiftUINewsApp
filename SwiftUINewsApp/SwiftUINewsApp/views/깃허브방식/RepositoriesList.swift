//
//  RepositoriesList.swift
//  InfiniteListSwiftUI
//
//  Created by Vadim Bulavin on 6/10/20.
//  Copyright © 2020 Vadim Bulavin. All rights reserved.
//

import SwiftUI
import Combine

class RepositoriesViewModel: ObservableObject {
    @Published private(set) var state = State()
    private var subscriptions = Set<AnyCancellable>()
    
    
    
    func fetchNews()  {
        guard state.canLoadNextPage else { return }
        
        Task{
            let resultList = await NewsSerchService().searchNews(
                requestModel: NewsRequestModel(
                    start: state.repos.count + 1 ,
                    display: 10,
                    query: "한국"
                )
                
            )
            await MainActor.run {
                state.repos += resultList
                state.page += 1
                state.canLoadNextPage = resultList.count == 10
            }
        }
        
        
    }

    


    struct State {
        var repos: [NewsItem] = []
        var page: Int = 1
        var canLoadNextPage = true
        
    }
}

struct RepositoriesListContainer: View {
    @ObservedObject var viewModel: RepositoriesViewModel
    
    var body: some View {
        ScrollView {
            RepositoriesList(
                repos: viewModel.state.repos,
                isLoading: viewModel.state.canLoadNextPage,
                onScrolledAtBottom: viewModel.fetchNews
            )
            .onAppear(perform: viewModel.fetchNews)
        }
        .navigationTitle("깃허브방식")
    }
}

struct RepositoriesList: View {
    let repos: [NewsItem]
    let isLoading: Bool
    let onScrolledAtBottom: () -> Void
    
    var body: some View {
      
            LazyVStack {
                reposList
                if isLoading {
                    loadingIndicator
                }
            }
        
    }
    
    private var reposList: some View {
        ForEach(repos) { repo in
            NavigationLink(destination: {Text("hello")}, label: {  RepositoryRow(repo: repo)
                    .padding()
                    .onAppear {
                    if self.repos.last?.id == repo.id {
                        self.onScrolledAtBottom()
                    }
                }})
          
        }
    }
    
    private var loadingIndicator: some View {
        Spinner(style: .medium)
            .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
    }
}

struct RepositoryRow: View {
    let repo: NewsItem
    
    var body: some View {
        VStack {
            Text(repo.title).font(.title)
            Text("⭐️ \(repo.pubDate)")
   
        }
        .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
    }
}
