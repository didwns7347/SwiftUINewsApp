//
//  ContentView.swift
//  SwiftUINewsApp
//
//  Created by yangjs on 2023/06/28.
//

import SwiftUI
import CoreData

struct NewsListView: View {
    @State private var searchKWD = ""
    @StateObject var newsListViewModel = NewsListViewModel()
    
    var body: some View {
        BodyView(vm: newsListViewModel)
            .onAppear {
            }
            .navigationTitle("뉴스정보")
            .searchable(text: $searchKWD)
            .onSubmit(of: .search) {
                self.newsListViewModel
                    .searchKWDSubmitted(keyword: self.searchKWD)
            }
    }
    

    
    
    
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NewsListView()
        }
        
    }
}
