//
//  Dashboard.swift
//  BigBucks (iOS)
//
//  Created by Isla Just's Macbook Pro on 2022/08/10.
//

import SwiftUI

struct Dashboard: View {
    
    
    let columns = [GridItem(.flexible(maximum: 190)),
                   GridItem(.fixed(150))]
    
    
    var body: some View {
        NavigationView{
        ZStack(){
            VStack{
            VStack(alignment: .center){
                
                
           Image("CoolCard")
                
            } .frame(maxWidth: .infinity, maxHeight: 200).padding(.top, 60).zIndex(100)
            

            VStack(){
        


                ZStack{
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color("DarkText").opacity(0.1))
                        .frame(width: .infinity, height: 70)
                        .padding(.horizontal, 35).padding(.top, 20)


                    HStack{
                        
                        Image(systemName: "magnifyingglass") .symbolRenderingMode(.multicolor)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20, alignment: .center)
                            .padding(.leading, 60).padding(.top, 20) .foregroundColor(Color("Primary"))
                        
                        
                        TextField("Search spending", text: .constant("Search spending"))
                            .background(Color.red.opacity(0))
                            .cornerRadius(5)
                            .padding(.horizontal, 10).padding(.top, 20) .accentColor(Color("Primary"))
                            .font(.system(size: 18, weight: .regular)).foregroundColor(Color("DarkText"))
                    }
                  
                }.padding(.top, 90)

                
           
                    ScrollView(.horizontal){
                        HStack{
                            Text("All items")
                                .underline(color: Color("Accent"))
                                .font(.system(size: 20, weight: .medium))
                                .multilineTextAlignment(.center).foregroundColor(Color("DarkText"))
                                .padding()
                            
                            Text("Snacks")
                                .font(.system(size: 20, weight: .light))
                                .multilineTextAlignment(.center).foregroundColor(Color("DarkText"))
                                .padding()
                            
                            Text("Toys")
                                .font(.system(size: 20, weight: .light))
                                .multilineTextAlignment(.center).foregroundColor(Color("DarkText"))
                                .padding()
                            
                            Text("Entertainment")
                                .font(.system(size: 20, weight: .light))
                                .multilineTextAlignment(.center).foregroundColor(Color("DarkText"))
                                .padding()
                            
                            Text("Learning")
                                .font(.system(size: 20, weight: .light))
                                .multilineTextAlignment(.center).foregroundColor(Color("DarkText"))
                                .padding()
                        }
                    }.frame(width: .infinity, height: 27).padding(.leading, 25).padding(.top, 20).padding(.bottom, 30)
                
                
                ScrollView(.vertical){
                    
                    LazyVGrid(columns: columns) {
                    
                    VStack{

                            
                            Circle()
                                .fill(Color("Accent"))
                                .frame(width: 40, height: 40)
                            
                            Text("20BB")
                                .font(.system(size: 30, weight: .semibold))
                                .multilineTextAlignment(.center).foregroundColor(Color("DarkText"))
                                .padding(.bottom, 1.0)
                                .padding(.horizontal, 15)
                       
                            Text("Fortnite")
                                .font(.system(size: 20, weight: .regular))
                                .multilineTextAlignment(.center).foregroundColor(Color("DarkText"))
                            Text("12 Jan")
                                .font(.system(size: 20, weight: .light))
                                .multilineTextAlignment(.center).foregroundColor(Color("DarkText"))
                      
                    }.padding(20).background(
                        
                            Rectangle()
                            .fill(Color.white)
                            .cornerRadius(20)
                            .shadow(
                                color: Color.gray.opacity(0.2),
                                radius: 20,
                                x: 0,
                                y: 2
                            )
                    ).padding(.bottom, 25)
                       
                        
                        VStack{

                                
                                Circle()
                                    .fill(Color("Light1"))
                                    .frame(width: 40, height: 40)
                                
                                Text("20BB")
                                    .font(.system(size: 30, weight: .semibold))
                                    .multilineTextAlignment(.center).foregroundColor(Color("DarkText"))
                                    .padding(.bottom, 1.0)
                                    .padding(.horizontal, 15)
                           
                                Text("Fortnite")
                                    .font(.system(size: 20, weight: .regular))
                                    .multilineTextAlignment(.center).foregroundColor(Color("DarkText"))
                                Text("12 Jan")
                                    .font(.system(size: 20, weight: .light))
                                    .multilineTextAlignment(.center).foregroundColor(Color("DarkText"))
                          
                        }.padding(20).background(
                            
                                Rectangle()
                                .fill(Color.white)
                                .cornerRadius(20)
                                .shadow(
                                    color: Color.gray.opacity(0.2),
                                    radius: 20,
                                    x: 0,
                                    y: 2
                                )
                        ).padding(.bottom, 25)
                        
                        VStack{

                                
                                Circle()
                                    .fill(Color("Yellows"))
                                    .frame(width: 40, height: 40)
                                
                                Text("20BB")
                                    .font(.system(size: 30, weight: .semibold))
                                    .multilineTextAlignment(.center).foregroundColor(Color("DarkText"))
                                    .padding(.bottom, 1.0)
                                    .padding(.horizontal, 15)
                           
                                Text("Fortnite")
                                    .font(.system(size: 20, weight: .regular))
                                    .multilineTextAlignment(.center).foregroundColor(Color("DarkText"))
                                Text("12 Jan")
                                    .font(.system(size: 20, weight: .light))
                                    .multilineTextAlignment(.center).foregroundColor(Color("DarkText"))
                          
                        }.padding(20).background(
                            
                                Rectangle()
                                .fill(Color.white)
                                .cornerRadius(20)
                                .shadow(
                                    color: Color.gray.opacity(0.2),
                                    radius: 20,
                                    x: 0,
                                    y: 2
                                )
                        ).padding(.bottom, 25)
                        
                        VStack{

                                
                                Circle()
                                    .fill(Color("Light2"))
                                    .frame(width: 40, height: 40)
                                
                                Text("20BB")
                                    .font(.system(size: 30, weight: .semibold))
                                    .multilineTextAlignment(.center).foregroundColor(Color("DarkText"))
                                    .padding(.bottom, 1.0)
                                    .padding(.horizontal, 15)
                           
                                Text("Fortnite")
                                    .font(.system(size: 20, weight: .regular))
                                    .multilineTextAlignment(.center).foregroundColor(Color("DarkText"))
                                Text("12 Jan")
                                    .font(.system(size: 20, weight: .light))
                                    .multilineTextAlignment(.center).foregroundColor(Color("DarkText"))
                          
                        }.padding(20).background(
                            
                                Rectangle()
                                .fill(Color.white)
                                .cornerRadius(20)
                                .shadow(
                                    color: Color.gray.opacity(0.2),
                                    radius: 20,
                                    x: 0,
                                    y: 2
                                )
                        ).padding(.bottom, 25)
                        
                        
                           
                       
                        
                    }.padding(0).padding(.leading, -25)
                }.padding(10)
                
                
                
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
                }
                
                

            }.padding(.bottom, 0).background().cornerRadius(38).padding(.top, -90)
          

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Primary"))
        .ignoresSafeArea()
            
            
            
        
    }
    }.navigationBarBackButtonHidden(true)
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
