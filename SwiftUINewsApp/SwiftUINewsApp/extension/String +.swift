//
//  String +.swift
//  SwiftUINewsApp
//
//  Created by yangjs on 2023/06/28.
//

import Foundation
extension String {
    func convertHTMLToString() -> String {
        guard let data = self.data(using: .utf8) else {
             return ""
         }
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [.documentType: NSAttributedString.DocumentType.html,.characterEncoding: String.Encoding.utf8.rawValue]
        guard let attributedString = try? NSAttributedString(data: data, options:options,  documentAttributes: nil) else {
             return ""
         }
         
         return attributedString.string
    }
}
