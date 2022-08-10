//
//  SignUp1.swift
//  BigBucks (iOS)
//
//  Created by Isla Just's Macbook Pro on 2022/08/10.
//

import SwiftUI

struct SignUp1: View {
    var body: some View {
        NavigationView{
        ZStack(){
            VStack{
                
             
                
                Image("logo1") .resizable()
                    .aspectRatio(contentMode: .fit).frame(width: 130)
                
                Spacer()
                
                Image("BigPeople") .resizable()
                    .aspectRatio(contentMode: .fit).frame(width: 206)
                
                Text("Pass the phone to the big people")
                    .font(.system(size: 30, weight: .medium))
                    .multilineTextAlignment(.center).foregroundColor(.white).padding(.top, 80)

                Text("mom or dad will do the rest")
                    .font(.system(size: 20, weight: .regular))
                    .multilineTextAlignment(.center).foregroundColor(.white).padding(.top, 1).padding(.bottom, 60)
                
                NavigationLink(destination: SignUp2()){
                  
                    Text("Got it!")
                      .frame(width: .infinity, height: 60)
                      .padding(.horizontal, 50).padding(.top, 0)
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.white, lineWidth: 1)
                    )
                    
                }.navigationBarBackButtonHidden(true)
                
             
                   
                  

                
                Spacer()
            }
            .padding(.vertical, 60.0)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("Primary"))
                .ignoresSafeArea()
        }.navigationBarBackButtonHidden(true)
    }
}

struct SignUp1_Previews: PreviewProvider {
    static var previews: some View {
        SignUp1()
    }
}
