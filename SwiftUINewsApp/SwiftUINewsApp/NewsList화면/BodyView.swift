//
//  BodyView.swift
//  SwiftUINewsApp
//
//  Created by yangjs on 2023/06/28.
//

import SwiftUI

struct BodyView: View {
    @ObservedObject var vm : NewsListViewModel
    var body: some View {
        if self.vm.newsList.isEmpty {
            EmptyView()
                .ignoresSafeArea(edges: .bottom)
        } else {
            ScrollView{
                LazyVStack{
                    ForEach(vm.newsList, id:\.link) { item in
                        NewsItemView(news: item)
                            .onAppear{
                                self.vm.loadNextPage(item)
                            }
                            .border(Color.secondary, width: 1)
                            .padding([.leading, .trailing])
                    }
                }
            }
            .background(Color("bgColor"))
        }
    }
}

struct BodyView_Previews: PreviewProvider {
    static var previews: some View {
        BodyView(vm: NewsListViewModel())
    }
}
