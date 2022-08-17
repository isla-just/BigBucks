//
//  Settings.swift
//  BigBucks (iOS)
//
//  Created by Isla Just's Macbook Pro on 2022/08/11.
//

import SwiftUI

struct Settings: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    @Environment(\.colorScheme) var colorScheme
    
    
    var body: some View {
        NavigationView{
        ZStack(){
            VStack{
            VStack(alignment: .center){
                
                ZStack(){
                    
                    HStack{

                        ZStack{
                            
                            Circle()
                                .fill(Color("Light1"))
                                .frame(width: 100, height: 100)
                                .padding(.leading, -230)
                                .padding(.top, -60)
                            
                            Circle()
                                .fill(Color("Light2"))
                                .frame(width: 30, height: 30)
                                .padding(.leading, 0)
                                .padding(.top, 40)
                            
                            Circle()
                                .fill(Color("Accent"))
                                .frame(width: 65, height: 65)
                                .padding(.leading, 140)
                                .padding(.top, -40)
                            
                            Circle()
                                .fill(Color("Light2"))
                                .frame(width: 100, height: 100)
                                .padding(.leading, 340)
                                .padding(.top, -140)
            
                            Circle()
                                .fill(Color("Light1"))
                                .frame(width: 138, height: 138)
                                .padding(.leading, 350)
                                .padding(.top, 100)
                        }
                        
                      
                    }
                 
                }.padding(-40)
                
            } .frame(maxWidth: .infinity, maxHeight: 150)
            

            VStack(){
                Text("settings")
                    .font(.system(size: 20, weight: .medium))
                    .multilineTextAlignment(.center).foregroundColor(Color("DarkText")).padding(.top, 50)
                    .frame(maxWidth: .infinity)
                
                
                Image("logo2") .resizable()
                    .aspectRatio(contentMode: .fit).frame(width: 230).padding(25)
 

                Text("Pocket money management app for \n kids. Teaching them how to \n manage money")
                    .font(.system(size: 22, weight: .regular))
                    .multilineTextAlignment(.center).foregroundColor(Color("DarkText")).padding()    .lineLimit(nil)
                    .fixedSize()


                Spacer()
                
                Text("You are using v 1.0")
                    .font(.system(size: 22, weight: .regular))
                    .multilineTextAlignment(.center).foregroundColor(Color("DarkText")).padding(.top, 1)

                Link("Developed by isla-just", destination: URL(string: "https://github.com/isla-just")!)  .font(.system(size: 20, weight: .regular))
                    .multilineTextAlignment(.center).foregroundColor(Color("DarkText")).padding(.top, -7).opacity(0.7)
            

     
                Spacer()
                
                
                ZStack{

                    Text("")
                      .frame(width: .infinity, height: 60)
                      .padding(.horizontal, 165).padding(4)
                      .font(.system(size: 22, weight: .medium))
                      .multilineTextAlignment(.center).foregroundColor(Color("DarkText"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color("DarkText"), lineWidth: 1)
                    )
                    
                    VStack{
                        Picker("Mode", selection: $isDarkMode){
                            Text("Pretty pink").tag(false)
                            Text("Bubble gum").tag(true)
                        }
                    }.opacity(1).accentColor(Color("DarkText"))

                }.padding(.bottom, -10)
             
                NavigationLink(destination: Dashboard()){
                  
                ZStack{
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color("DarkText"))
                        .frame(width: .infinity, height: 70)
                        .padding(.horizontal, 35).padding(.top, 20)

                    Text("Back Home")
                        .font(.system(size: 22, weight: .medium))
                        .multilineTextAlignment(.center).foregroundColor(.white)
                        .padding(.horizontal, 50).padding(.top, 20)
                }.padding(.bottom, 10)
                }
                Spacer()
                
              
            }.padding(.bottom,  -15.0).background(.white).cornerRadius(38)    .frame(maxWidth: .infinity, maxHeight: .infinity)
          

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Primary"))
        .ignoresSafeArea()
            
         
    }
    }.navigationBarBackButtonHidden(true).navigationBarHidden(true)
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
