//
//  Login.swift
//  BigBucks (iOS)
//
//  Created by Isla Just's Macbook Pro on 2022/08/09.
//

import SwiftUI

struct Login: View {
    var body: some View {
        NavigationView{
        ZStack(){
            VStack{
            VStack(alignment: .center){
                
                ZStack(){
                    Circle()
                        .fill(Color("Light1"))
                        .frame(width: 100, height: 100)
                        .padding(.leading, -220.0)
                        .padding(.top, -150.0)
                    
                    Circle()
                        .fill(Color("Light2"))
                        .frame(width: 30, height: 30)
                        .padding(.leading, -80.0)
                        .padding(.top, -40.0)
                    
                    Circle()
                        .fill(Color("Accent"))
                        .frame(width: 65, height: 65)
                        .padding(.leading, -100.0)
                        .padding(.top, 110.0)
                    
                    Circle()
                        .fill(Color("Light1"))
                        .frame(width: 100, height: 100)
                        .padding(.leading, 340.0)
                        .padding(.top, -180.0)
                    
                
                }.padding(-10)
                
            } .frame(maxWidth: .infinity, maxHeight: 200)
            

            VStack(){
                Text("Hello again!")
                    .font(.system(size: 30, weight: .medium))
                    .multilineTextAlignment(.center).foregroundColor(Color("DarkText")).padding(.top, 80)

                Text("welcome back to Big Bucks")
                    .font(.system(size: 20, weight: .regular))
                    .multilineTextAlignment(.center).foregroundColor(Color("DarkText")).padding(.top, 1)


                ZStack{
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color("DarkText").opacity(0.1))
                        .frame(width: .infinity, height: 70)
                        .padding(.horizontal, 35).padding(.top, 20)



                    TextField("username", text: .constant("Username"))
                        .background(Color.red.opacity(0))
                        .cornerRadius(5)
                        .padding(.horizontal, 50).padding(.top, 20) .accentColor(Color("Primary"))
                        .font(.system(size: 18, weight: .regular)).foregroundColor(Color("DarkText"))
                }

                ZStack{
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color("DarkText").opacity(0.1))
                        .frame(width: .infinity, height: 70)
                        .padding(.horizontal, 35).padding(.top, 20)



                    TextField("password", text: .constant("password"))
                        .background(Color.red.opacity(0))
                        .cornerRadius(5)
                        .padding(.horizontal, 50).padding(.top, 20) .accentColor(Color("Primary"))
                        .font(.system(size: 18, weight: .regular)).foregroundColor(Color("DarkText"))
                }

                HStack{
                    Spacer()
                    Text("forgot password?")
                        .underline()
                        .padding([.trailing], 30.0).padding()
                        .font(.system(size: 18, weight: .regular))
                        .multilineTextAlignment(.trailing).foregroundColor(Color("DarkText")).padding(.top, 1)
                }
                
                NavigationLink(destination: Dashboard()){
                  

                ZStack{
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color("DarkText"))
                        .frame(width: .infinity, height: 70)
                        .padding(.horizontal, 35).padding(.top, 20)

                    Text("Sign in")
                        .font(.system(size: 22, weight: .medium))
                        .multilineTextAlignment(.center).foregroundColor(.white)
                        .padding(.horizontal, 50).padding(.top, 20)
                }
                }.navigationBarBackButtonHidden(true).navigationBarHidden(true)
                    
                HStack(alignment: .center){
                    Text("Don't have an account yet?")
                        .font(.system(size: 18, weight: .medium))
                        .multilineTextAlignment(.center).foregroundColor(Color("DarkText"))
                    
                    NavigationLink(destination: SignUp()){
                    Text("Sign up")
                        .font(.system(size: 18, weight: .semibold))
                        .multilineTextAlignment(.center).foregroundColor(Color("Accent"))
                    }.navigationBarBackButtonHidden(true)
                }
                .padding(.top)

            }.padding(.bottom,  120.0).background(.white).cornerRadius(38)
          

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Primary"))
        .ignoresSafeArea()
            
            ZStack{
                Image("Kiddie")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 450.0)
            }.padding(.leading, 100.0).frame(height: 450, alignment: .trailing).padding(.top, -450).zIndex(100)
    }
    }.navigationBarBackButtonHidden(true).navigationBarHidden(true)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
