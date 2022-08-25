//
//  SpendData.swift
//  BigBucks (iOS)
//
//  Created by Isla Just's Macbook Pro on 2022/08/17.
//

import SwiftUI

let SpendData: [Spend] = [
    
 Spend(name: "Fortnite", category: "Entertainment", cost: 70, date: "12 Jan", notes: "I bought save the world to play with my friends", circleColor: Color("Accent")),
 Spend(name: "Nerds", category: "Snacks", cost: 16, date: "1 Jan", notes: "Jonny and I went to the candy shop and I really really wanted some nerds", circleColor: Color("Light1")),
 Spend(name: "Hot Wheels", category: "Toys", cost: 50, date: "5 Jan", notes: "We went to Toys r Us this weekend with mom and dad. I have been saving up to buy this for a long long time", circleColor: Color("Yellows")),
 Spend(name: "Space book", category: "Learning", cost: 20, date: "9 Jan", notes: "I wanted to learn more about space ever since Mrs Evans my science teacher taught us about it at school", circleColor: Color("Light2")),
 Spend(name: "Popcorn", category: "Snacks", cost: 10, date: "20 Jan", notes: "I really wanted some popcorn at the fair and mom and dad said I could buy it with my own money", circleColor: Color("Light1")),
 Spend(name: "Buid a Bear", category: "Toys", cost: 90, date: "27 Jan", notes: "I made a build a bear this weekend named Harry!!", circleColor: Color("Accent")),
 Spend(name: "Movies", category: "Entertainment", cost: 55, date: "30 Jan", notes: "I went to the movies this weekend with my friends", circleColor: Color("Light2")),
 Spend(name: "Penguins", category: "Learning", cost: 20, date: "17 Jan", notes: "I'm so excited to learn about penguins because I saw them on Doc Mcstuffins", circleColor: Color("Yellows")),
 Spend(name: "Minecraft", category: "Entertainment", cost: 70, date: "15 Jan", notes: "I wanna play minecraft with friend Alex", circleColor: Color("Accent")),
 Spend(name: "Sweeties", category: "Snacks", cost: 10, date: "30 Jan", notes: "At the candy shop", circleColor: Color("Accent")),
]


func getSpend(spend: String)->[Spend]{
    var spends: [Spend] = []
    
    //here you loop through all cities
    if(spend=="Entertainment"){
        spends.append(
            Spend(name: "Fortnite", category: "Entertainment", cost: 70, date: "12 Jan", notes: "I bought save the world to play with my friends", circleColor: Color("Accent"))
        )
        
        spends.append(
            Spend(name: "Fortnite", category: "Entertainment", cost: 70, date: "12 Jan", notes: "I bought save the world to play with my friends", circleColor: Color("Accent"))
        )
        
        spends.append(
           Spend(name: "Minecraft", category: "Entertainment", cost: 70, date: "15 Jan", notes: "I wanna play minecraft with friend Alex", circleColor: Color("Accent"))
        )
        

    }else if(spend=="Snacks"){
        spends.append(
            Spend(name: "Nerds", category: "Snacks", cost: 16, date: "1 Jan", notes: "Jonny and I went to the candy shop and I really really wanted some nerds", circleColor: Color("Light1"))
        )
        
        spends.append(
            Spend(name: "Popcorn", category: "Snacks", cost: 10, date: "20 Jan", notes: "I really wanted some popcorn at the fair and mom and dad said I could buy it with my own money", circleColor: Color("Light1"))
        )
        
        
        spends.append(
            Spend(name: "Sweeties", category: "Snacks", cost: 10, date: "30 Jan", notes: "At the candy shop", circleColor: Color("Accent"))
        )
    }else if(spend=="Toys"){
        spends.append(
            Spend(name: "Hot Wheels", category: "Toys", cost: 50, date: "5 Jan", notes: "We went to Toys r Us this weekend with mom and dad. I have been saving up to buy this for a long long time", circleColor: Color("Yellows"))
        )
        
        spends.append(
            Spend(name: "Buid a Bear", category: "Toys", cost: 90, date: "27 Jan", notes: "I made a build a bear this weekend named Harry!!", circleColor: Color("Accent"))
        )
    }else if(spend=="Learning"){
        spends.append(
            Spend(name: "Space book", category: "Learning", cost: 20, date: "9 Jan", notes: "I wanted to learn more about space ever since Mrs Evans my science teacher taught us about it at school", circleColor: Color("Light2"))
        )
        
        spends.append(
            Spend(name: "Penguins", category: "Learning", cost: 20, date: "17 Jan", notes: "I'm so excited to learn about penguins because I saw them on Doc Mcstuffins", circleColor: Color("Yellows"))
        )
    }
    
    return spends
}

