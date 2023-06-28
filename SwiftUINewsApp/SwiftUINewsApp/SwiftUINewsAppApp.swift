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

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
