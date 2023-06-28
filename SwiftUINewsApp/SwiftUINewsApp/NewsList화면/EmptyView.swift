//
//  EmptyView.swift
//  SwiftUINewsApp
//
//  Created by yangjs on 2023/06/28.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color("bgColor"))
            VStack{
                Text("검색어를 입력해 주세요...")
                    .foregroundColor(.secondary)
                Image("k-child")
                    .resizable()
                    .frame(width: 200, height: 300)
            }
        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
