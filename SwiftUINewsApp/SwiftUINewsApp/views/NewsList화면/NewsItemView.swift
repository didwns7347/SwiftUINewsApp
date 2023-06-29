//
//  NewsItemView.swift
//  SwiftUINewsApp
//
//  Created by yangjs on 2023/06/28.
//

import SwiftUI

struct NewsItemView: View {
    let item : NewsItem
    var body: some View {
        VStack(alignment:.leading) {
            
            Text(item.title)
                .lineLimit(1)
                .font(.title)
                .foregroundColor(.black)
            Text(item.description)
                .lineLimit(2)
                .font(.subheadline)
                .foregroundColor(.black)
            Spacer()
            Text(item.pubDate)
                .font(.callout)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        
        
    }
}

//struct NewsItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsItemView(item: NewsItem(news: News.sampleDatas[0]))
//            .previewLayout(.fixed(width: 400, height: 100))
//    }
//}
