//
//  SignUp3.swift
//  BigBucks (iOS)
//
//  Created by Isla Just's Macbook Pro on 2022/08/10.
//

import SwiftUI

struct SignUp3: View {
    var body: some View {
        NavigationView{
        ZStack(){
            VStack{
            VStack(alignment: .center){
                
                ZStack(){
                    
                    HStack{
                        HStack(){
                            
                    
                            Image("logo1").resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.leading, 80.0)
                                .frame(width: 201)
                            
                            Spacer()
                        }
                        .padding(.top, -20)
                        
                        ZStack{
                            Circle()
                                .fill(Color("Light2"))
                                .frame(width: 30, height: 30)
                                .padding(.leading, -100)
                                .padding(.top, 40)
                            
                            Circle()
                                .fill(Color("Accent"))
                                .frame(width: 65, height: 65)
                                .padding(.leading, -60)
                                .padding(.top, -40)
                            
                            Circle()
                                .fill(Color("Light2"))
                                .frame(width: 100, height: 100)
                                .padding(.leading, 140)
                                .padding(.top, -140)
            
                            Circle()
                                .fill(Color("Light1"))
                                .frame(width: 138, height: 138)
                                .padding(.leading, 140)
                                .padding(.top, 100)
                        }
                        
                      
                    }
                 
                   
                    
              
                    
                 
                    
                
                }.padding(-40)
                
            } .frame(maxWidth: .infinity, maxHeight: 200)
            

            VStack(){
                Text("Let’s set up his monthly \n pocket money")
                    .font(.system(size: 30, weight: .medium))
                    .multilineTextAlignment(.center).foregroundColor(Color("DarkText"))
                    .lineLimit(nil)
                    .fixedSize()
                    .padding(.top, 80)

                Text("Whatever currency you’re using is \n equal to 1 BB")
                    .font(.system(size: 20, weight: .regular))
                    .multilineTextAlignment(.center).foregroundColor(Color("DarkText")).padding(.top, 1)
                    .lineLimit(nil)
                    .fixedSize()


                ZStack{
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color("DarkText").opacity(0.1))
                        .frame(width: .infinity, height: 70)
                        .padding(.horizontal, 35).padding(.top, 20)



                    TextField("Amount", text: .constant("Amount"))
                        .background(Color.red.opacity(0))
                        .cornerRadius(5)
                        .padding(.horizontal, 50).padding(.top, 20) .accentColor(Color("Primary"))
                        .font(.system(size: 18, weight: .regular)).foregroundColor(Color("DarkText"))
                }.padding(.top, 60.0)
                
                NavigationLink(destination: Dashboard()){
                  

                ZStack{
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color("DarkText"))
                        .frame(width: .infinity, height: 70)
                        .padding(.horizontal, 35).padding(.top, 20)

                    Text("Done")
                        .font(.system(size: 22, weight: .medium))
                        .multilineTextAlignment(.center).foregroundColor(.white)
                        .padding(.horizontal, 50).padding(.top, 20)
                }.padding(.top, 150.0)
                }.navigationBarBackButtonHidden(true)
                
                HStack{
                    
                    Circle()
                        .fill(Color("Primary").opacity(0.6))
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(Color("Primary"))
                        .frame(width: 13, height: 13)
                   
                    
                }.padding(.top, 20.0)
              
            }.padding(.bottom,  190.0).background().cornerRadius(38)
          

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Primary"))
        .ignoresSafeArea()
            
         
    }
    }.navigationBarBackButtonHidden(true).navigationBarHidden(true)
    }
}

struct SignUp3_Previews: PreviewProvider {
    static var previews: some View {
        SignUp3()
    }
}
