//
//  Intro.swift
//  BigBucks (iOS)
//
//  Created by Isla Just's Macbook Pro on 2022/08/03.
//

import SwiftUI

struct Intro: Identifiable{
    var id = UUID().uuidString
    var title: String
    var logo: String
    var subTitle: String
    var description: String
    var img: String
    var color: Color
    var accent: Color
    var offset: CGSize = .zero
}
