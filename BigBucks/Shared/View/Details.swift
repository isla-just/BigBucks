//
//  Details.swift
//  BigBucks (iOS)
//
//  Created by Isla Just's Macbook Pro on 2022/08/10.
//

import SwiftUI

struct Details: View {

    
    // MARK: - Properties
    var spend: Spend
    
    
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
                
                HStack{
                    Circle()
                        .fill(spend.circleColor)
                        .frame(width: 20, height: 20)
                        .padding(2)

                    
                    Text(spend.name)
                        .font(.system(size: 30, weight: .medium))
                        .multilineTextAlignment(.center).foregroundColor(Color("DarkText"))
                        .lineLimit(nil)
                        .fixedSize()
                        .padding(2)
                }  .padding(.top, 80)
             

                Text("\(spend.category) purchase")
                    .font(.system(size: 20, weight: .regular))
                    .multilineTextAlignment(.center).foregroundColor(Color("DarkText")).padding(.top, 1)

                
                Text(spend.date)
                    .font(.system(size: 20, weight: .light))
                    .multilineTextAlignment(.center).foregroundColor(Color("DarkText")).padding(.top, 0.1)
    
                Spacer();

                ZStack{
                    Circle()
                        .fill(spend.circleColor)
                        .frame(width: 64, height: 64)
                    
                    Circle()
                        .fill(spend.circleColor).opacity(0.6)
                        .frame(width: 88, height: 88)
                    
                    
                    Circle()
                        .fill(spend.circleColor).opacity(0.3)
                        .frame(width: 112, height: 112)
                    
                    Text("-\(spend.cost)BB")
                        .font(.system(size: 70, weight: .semibold))
                        .multilineTextAlignment(.center).foregroundColor(Color("DarkText")).padding(.top, 0.1)
                
                }.padding(.top, 60)
                
                ZStack{
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color("Card"))
                        .frame(width: .infinity, height: 140)
                        .padding(.horizontal, 35).padding(.top, 20)

                    Text(spend.notes) .colorMultiply(Color("Card"))
                        .background(Color("Card"))
                        .cornerRadius(5)
                        .padding(.horizontal, 60).padding(.top, -20) .accentColor(Color("Accent"))
                        .font(.system(size: 18, weight: .regular)).foregroundColor(Color("DarkText"))

                }.padding(.top, 20.0)
                
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
                }.padding(.top, 0.0)
                }.navigationBarBackButtonHidden(true)
                
            }.padding(.bottom,  190.0).background(.white).cornerRadius(38)
          

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Primary"))
        .ignoresSafeArea()
            
         
    }
    }.navigationBarBackButtonHidden(true).navigationBarHidden(true)
    }
}

struct Details_Previews: PreviewProvider {
    static var previews: some View {
        Details(spend: SpendData[0])
    }
}
