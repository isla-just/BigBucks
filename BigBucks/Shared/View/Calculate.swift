//
//  Calculate.swift
//  BigBucks (iOS)
//
//  Created by Isla Just's Macbook Pro on 2022/08/17.
//

import SwiftUI

struct Calculate: View {
    
    let grid = [
            ["c","","", "+"],
            ["1", "2", "3", "-"],
            ["4", "5", "6", "x"],
            ["7", "8", "9", "/"],
            ["0", "", "", "="]
        ]
        
        let operators = ["/", "+", "x", "-"]
        
        @State var visibleWorkings = ""
        @State var visibleResults = ""

        var body: some View
        {
            
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
                    

            
                    
               
                        
                    
                    VStack{
                    ForEach(grid, id: \.self)
                                {
                                    row in
                                    HStack
                                    {
                                        ForEach(row, id: \.self)
                                        {
                                            cell in
                                            
                                            Button(action: { buttonPressed(cell: cell)}, label: {
                                                Text(cell)
                                                    .foregroundColor(Color("DarkText"))
                                                    .font(.system(size: 30, weight: .regular))
                                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                                
                                            }).padding()
                                            
                                        }
                                    }
                                }
                    }.padding(.top, 150)

                    NavigationLink(destination: Dashboard()){


                    ZStack{
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color("DarkText"))
                            .frame(width: .infinity, height: 70)
                            .padding(.horizontal, 35).padding(.top, 20)

                        Text("Back home")
                            .font(.system(size: 22, weight: .medium))
                            .multilineTextAlignment(.center).foregroundColor(.white)
                            .padding(.horizontal, 50).padding(.top, 20)
                    }.padding(.top, 20.0)
                    }.navigationBarBackButtonHidden(true)
                    

                  
                }.padding(.bottom,  190.0).background(.white).cornerRadius(38)
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color("DarkText"))
                            .frame(width: .infinity, height: 150)
                            .padding(.horizontal, 35).padding(.top, 20)

                        Text(visibleWorkings)
                            .font(.system(size: 22, weight: .medium))
                            .multilineTextAlignment(.center).foregroundColor(.white)
                            .padding(.horizontal, 50).padding(.top, -20)

                        Text(visibleResults)
                            .font(.system(size: 32, weight: .bold))
                            .multilineTextAlignment(.center).foregroundColor(.white)
                            .padding(.horizontal, 50).padding(.top, 50)
                    }.padding(.top, -900.0).zIndex(100.00)
              
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Primary"))
            .ignoresSafeArea()
                
             
        }
                
        }.navigationBarBackButtonHidden(true).navigationBarHidden(true)
            
    }
    
    
    func buttonPressed(cell: String)
        {
            
            switch (cell)
            {
            case "c":
                visibleWorkings = ""
                visibleResults = ""
            case "=":
                visibleResults = calculateResults()
            case "-":
                addMinus()
            case "x", "/", "+":
                addOperator(cell)
            default:
                visibleWorkings += cell
            }
            
        }
    
    func addOperator(_ cell : String)
    {
        if !visibleWorkings.isEmpty
        {
            let last = String(visibleWorkings.last!)
            if operators.contains(last)
            {
                visibleWorkings.removeLast()
            }
            visibleWorkings += cell
        }
    }
    
    func addMinus()
    {
        if visibleWorkings.isEmpty || visibleWorkings.last! != "-"
        {
            visibleWorkings += "-"
        }
    }
    
    
    func calculateResults() -> String
    {
        if(validInput())
        {
            var workings = visibleWorkings.replacingOccurrences(of: "%", with: "*0.01")
            workings = workings.replacingOccurrences(of: "x", with: "*")
            let expression = NSExpression(format: workings)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            return formatResult(val: result)
        }
        return ""
    }
    
    func validInput() -> Bool
    {
        if(visibleWorkings.isEmpty)
        {
            return false
        }
        let last = String(visibleWorkings.last!)
        
        if(operators.contains(last) || last == "-")
        {
            if(last != "%" || visibleWorkings.count == 1)
            {
                return false
            }
        }
        
        return true
    }
    
    func formatResult(val : Double) -> String
    {
        if(val.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", val)
        }
        
        return String(format: "%.2f", val)
    }
    
}



struct Calculate_Previews: PreviewProvider {
    static var previews: some View {
        Calculate()
    }
}
