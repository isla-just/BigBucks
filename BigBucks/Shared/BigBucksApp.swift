//
//  BigBucksApp.swift
//  Shared
//
//  Created by Isla Just's Macbook Pro on 2022/08/02.
//

import SwiftUI

@main
struct BigBucksApp: App {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some Scene {
        WindowGroup {
            ContentView().preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
