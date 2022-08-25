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
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false;
    
    var body: some Scene {
        WindowGroup {
            
            if(isLoggedIn){
            Dashboard().preferredColorScheme(isDarkMode ? .dark: .light)
                 
            }else{
                Home().preferredColorScheme(isDarkMode ? .dark: .light)
                    
            }
        }
    }
}
