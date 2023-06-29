//
//  BodyView.swift
//  SwiftUINewsApp
//
//  Created by yangjs on 2023/06/28.
//

import SwiftUI

struct BodyView: View {
    var list : [NewsItem]
    let loadmore : () -> ()
    var body: some View {
     
            LazyVStack{
                newsList
            }
        
    }
    
    
    private var newsList : some View {
        ForEach(list) { item in
            NavigationLink(
                destination: {
                    NewsDetailView(url: item.link)
                },
                label: {
                    NewsItemView(item: item)
                        .border(Color.secondary, width: 1)
                        .padding([.leading, .trailing])
                        .onAppear{
                            if item.id == list.last?.id {
                                loadmore()
                            }
                        }
                }
            )
        }
    }
     
}

//struct BodyView_Previews: PreviewProvider {
//    static var previews: some View {
//        BodyView(list: News.sampleDatas.map{NewsItem(news: $0)},
//                 loadmore:NewsListViewModel().loadNextPage)
//    }
//}
/**
 ForEach(vm.newsList) { item in
 NavigationLink(
 destination: {
 NewsDetailView(url: item.news.link)
 },
 label: {
 NewsItemView(item: item)
 .onAppear{
 self.vm.loadNextPage(item)
 }
 .border(Color.secondary, width: 1)
 .padding([.leading, .trailing])
 }
 )
 }
 */
