//
//  NewsDetailView.swift
//  SwiftUINewsApp
//
//  Created by yangjs on 2023/06/28.
//

import SwiftUI

struct NewsDetailView: View {
    let url : String
    
    var body: some View {
        WebView(url: URL(string: url)!)
            .onAppear{
                print(url)
            }
            
            
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView(url: "https://www.naver.com")
    }
}
