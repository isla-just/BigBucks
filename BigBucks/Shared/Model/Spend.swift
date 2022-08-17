//
//  Spend.swift
//  BigBucks (iOS)
//
//  Created by Isla Just's Macbook Pro on 2022/08/17.
//

import SwiftUI

struct Spend: Identifiable {
    var id = UUID() //generates an id for me
    var name: String
    var category: String
    var cost: Int
    var date: String
    var notes: String
    var circleColor: Color
}
