//
//  NewsItemView.swift
//  SwiftUINewsApp
//
//  Created by yangjs on 2023/06/28.
//

import SwiftUI

struct NewsItemView: View {
    let news : News
    var body: some View {
        VStack(alignment:.leading) {
            Text(news.title.convertHTMLToString())
                .lineLimit(1)
                .font(.headline)
            Text(news.description.convertHTMLToString())
                .lineLimit(2)
                .font(.subheadline)
            Spacer()
            Text(news.dateString)
                .font(.callout)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        
    }
}

struct NewsItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewsItemView(news: News.sampleDatas[0])
            .previewLayout(.fixed(width: 400, height: 100))
    }
}
