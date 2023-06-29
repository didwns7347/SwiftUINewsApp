//
//  SwiftUINewsAppApp.swift
//  SwiftUINewsApp
//
//  Created by yangjs on 2023/06/28.
//

import SwiftUI

@main
struct SwiftUINewsAppApp: App {
    let persistenceController = PersistenceController.shared
    let sample = News.sampleDatas
    var body: some Scene {
        WindowGroup {
            NavigationStack{
//                RepositoriesListContainer(viewModel: RepositoriesViewModel())
                NewsListView(newsListViewModel: NewsListViewModel())
            }
                
        }
    }
}
