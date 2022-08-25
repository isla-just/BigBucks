//
//  Dashboard.swift
//  BigBucks (iOS)
//
//  Created by Isla Just's Macbook Pro on 2022/08/10.
//

import SwiftUI

struct Dashboard: View {
    
    
    // MARK: - properties
    @State var spends: [Spend] = SpendData
    @State var isSearchText: String = ""
    
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
                            .padding(.leading, 60).padding(.top, 20) .foregroundColor(Color("DarkText"))
                        
                        
                        TextField("Search spending", text: $isSearchText)
                            .background(Color.red.opacity(0))
                            .cornerRadius(5)
                            .padding(.horizontal, 10).padding(.top, 20) .accentColor(Color("Accent"))
                            .font(.system(size: 18, weight: .regular)).foregroundColor(Color("DarkText"))
                    }  
                  
                }.padding(.top, 90)

                
           
                    ScrollView(.horizontal){
                        HStack{
                            
                            Button(action: {self.spends = SpendData}, label: {Text("All items")    .underline(color: Color("Accent"))
                                    .font(.system(size: 20, weight: .medium))
                                    .multilineTextAlignment(.center).foregroundColor(Color("DarkText"))
                                    .padding()
                                
                            })
                            
                            
                            Button(action: {self.spends = getSpend(spend: "Snacks")}, label: {Text("Snacks") .font(.system(size: 20, weight: .light))
                                    .multilineTextAlignment(.center).foregroundColor(Color("DarkText"))
                                    .padding()
                                
                            })
                            
                        
                            Button(action: {self.spends = getSpend(spend: "Toys")}, label: {Text("Toys") .font(.system(size: 20, weight: .light))
                                    .multilineTextAlignment(.center).foregroundColor(Color("DarkText"))
                                    .padding()
                                
                            })
                            
                            Button(action: {self.spends = getSpend(spend: "Entertainment")}, label: {Text("Entertainment") .font(.system(size: 20, weight: .light))
                                    .multilineTextAlignment(.center).foregroundColor(Color("DarkText"))
                                    .padding()
                                
                            })
                            
                            Button(action: {self.spends = getSpend(spend: "Learning")}, label: {Text("Learning") .font(.system(size: 20, weight: .light))
                                    .multilineTextAlignment(.center).foregroundColor(Color("DarkText"))
                                    .padding()
                                
                            })

                        }
                    }.frame(width: .infinity, height: 27).padding(.leading, 25).padding(.top, 20).padding(.bottom, 0)
                
                
                ScrollView(.vertical){
                    
                    VStack{
         
                    LazyVGrid(columns: columns) {
                        
                        ForEach(spends) {spend in
                            NavigationLink(destination: Details(spend: spend)) {
                    
                                VStack{

                                        Circle()
                                        .fill(spend.circleColor)
                                            .frame(width: 40, height: 40)
                                        
                                        Text("\(spend.cost)BB")
                                            .font(.system(size: 30, weight: .semibold))
                                            .multilineTextAlignment(.center).foregroundColor(Color("DarkText"))
                                            .padding(.bottom, 1.0)
                                            .padding(.horizontal, 15)
                                   
                                    Text(spend.name)
                                            .font(.system(size: 20, weight: .regular))
                                            .multilineTextAlignment(.center).foregroundColor(Color("DarkText"))
                                    Text(spend.date)
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
                                
                            }
                        }//foreach
                    
                    }.padding(10).padding(.top, 20)
                    
                }.frame(width: .infinity)
                
                
                
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

                        NavigationLink(destination: Calculate()){
                        VStack{
                            Text("calculator")
                                .font(.system(size: 20, weight: .regular))
                                .multilineTextAlignment(.center).foregroundColor(.white)
                        }.padding(.top, -20).padding()
                        }

                        NavigationLink(destination: Settings()){
                            VStack{
                                Text("settings")
                                    .font(.system(size: 20, weight: .regular))
                                    .multilineTextAlignment(.center).foregroundColor(.white)
                            }.padding(.top, -20).padding()
                        }.navigationBarBackButtonHidden(true).navigationBarHidden(true)
                       

                    }.padding(.horizontal, 30)
                }.padding(.bottom, 0)
                
                

            }.padding(.bottom, 0).background(.white).cornerRadius(38).padding(.top, -90)
          

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Primary"))
        .ignoresSafeArea()
            
            
            
        
    }
    }.navigationBarBackButtonHidden(true).navigationBarHidden(true)
            .onChange(of: isSearchText){ _ in
                if(!isSearchText.isEmpty){
                    self.spends = SpendData.filter{ $0.name.contains(isSearchText)}
                }else{
                    self.spends=SpendData
                }
           }
    }
    
    func searchData()->[Spend]{
        
      return SpendData.filter{ $0.name.contains(isSearchText)}
    }
    
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
