//
//  Navigation.swift
//  BigBucks (iOS)
//
//  Created by Isla Just's Macbook Pro on 2022/08/10.
//

import SwiftUI

struct Navigation: View {
    var body: some View {
        NavigationView{
            ZStack{
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color("DarkText"))
                    .frame(width: .infinity, height: 90)

                
                HStack{
                    
                    VStack{
                        Text("home")
                            .underline(color: Color("Accent"))
                            .font(.system(size: 20, weight: .regular))
                            .multilineTextAlignment(.center).foregroundColor(.white)
                    }.padding(.top, -20).padding()
                    
                    VStack{
                        Text("calculator")
                            .font(.system(size: 20, weight: .regular))
                            .multilineTextAlignment(.center).foregroundColor(.white)
                    }.padding(.top, -20).padding()
                    
                    VStack{
                        Text("settings")
                            .font(.system(size: 20, weight: .regular))
                            .multilineTextAlignment(.center).foregroundColor(.white)
                    }.padding(.top, -20).padding()
                    
                    
                
                    
                    
                }.padding(.horizontal, 30)

            }.padding(.top, 0.0)
        }
    }
}


struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}
