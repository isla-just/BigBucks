//
//  ContentView.swift
//  Shared
//
//  Created by Isla Just's Macbook Pro on 2022/08/02.
//

import SwiftUI

struct ContentView: View {
    
    @State var items: [Item]=[
        Item(title: "Join the family", logo: "logo2", subtitle: "learn how to manage your big bucks every month", pic: "Onboard1", color: Color("White")),
        
        Item(title: "Track", logo: "logo1", subtitle: "track the spending of your big bucks every month", pic: "Onboard2", color: Color("Primary")),
        
        Item(title: "Spoil yourself!", logo: "logo2", subtitle: "spend your pocket money on the things you want the most", pic: "Onboard3", color: Color("White")),
        
    ]

    @GestureState var isDragging: Bool = false
    @State var fakeIndex: Int = 0
    @State var currentIndex: Int=0
    
    var body: some View {
        ZStack{
            ForEach(items.indices.reversed(),id: \.self){ index in
                ItemView(item: items[index])
                    .clipShape(LiquidShape(offset: items[index].offset, currentPoint: fakeIndex == index ? 50 : 0))
                    .padding(.trailing, fakeIndex == index ? 15 : 0)
            }
            
            HStack(spacing: 8){
                ForEach(0..<items.count - 2, id: \.self){ index in
                    Circle()
                        .fill(.white)
                        .frame(width: 20, height: 20)
                        .scaleEffect(currentIndex == index ? 1.5 : 0.85)
                        .opacity(currentIndex == index ? 1.5 : 0.25)
                    
                }
                Spacer()
                Button(action:{}, label:{
                    Text("Skip")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                })
            }
            .padding()
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight:.infinity, alignment:.bottom)
        }.overlay(Image(systemName: "circle.fill")
            .font(.callout)
            .frame(width:50, height:50)
            .foregroundColor(.red)
            .contentShape(Rectangle())
            .gesture(DragGesture().updating($isDragging, body:{value, out, _ in
                out = false
            })
                .onChanged({ value in
                    withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.6, blendDuration: 0.6)){
                        items[fakeIndex].offset = isDragging ? value.translation : .zero
                    }
                })
                    .onEnded({value in
                        withAnimation(.spring()){
                            if -items[fakeIndex].offset.width > getRec().width/2{
                                items[fakeIndex].offset.width = -getRec().height * 1.5
                                fakeIndex += 1
                                
                                if currentIndex == items.count - 3 {
                                    currentIndex=0
                                }else{
                                    currentIndex += 1
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                                    if fakeIndex == (items.count - 2){
                                        for index in 0..<items.count - 2 {
                                            items[index].offset = .zero
                                        }
                                        fakeIndex = 0
                                    }
                                }
                            }else{
                                items[fakeIndex].offset = .zero
                            }
                        }
                    })
                    )
                .offset(y: 53)
                .opacity(isDragging ? 0 : 1)
                .animation(.linear, value: isDragging),alignment: .topTrailing
                )
        .onAppear{
            
            guard let first = items.first else{return}; guard var last = items.last else{return}
            
            last.offset.width = -getRec().height * 1.5
            items.append(first)
            items.insert(last, at: 0)
            fakeIndex = 1
                  
                  }
    }
                  
    @ViewBuilder
    func ItemView(item: Item)-> some View{
        VStack(){
            
            //style this later
            Image(item.logo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(40)
                .frame(width: getRec().width - 50)
            
            
            
            Image(item.pic)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(40)
                .frame(width: getRec().width - 50)
                
            Text(item.title)
                .font(.system(size: 30, weight: .semibold))
            Text(item.subtitle)
                .font(.system(size: 20))
               .frame(width: getRec().width - 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(item.color)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//item model and sample screens
struct Item: Identifiable{
    var id=UUID().uuidString
    var title:String
    var logo:String
    var subtitle:String
    var pic:String
    var color:Color
    var offset:CGSize = .zero
}

extension View{
    func getRec()->CGRect{
        return UIScreen.main.bounds
    }
}

struct LiquidShape:Shape{
    var offset:CGSize
    var currentPoint:CGFloat
    var animatableData: AnimatablePair<CGSize.AnimatableData, CGFloat>{
        get{
            return AnimatablePair(offset.animatableData, currentPoint)
        }set{
            offset.animatableData = newValue.first
            currentPoint=newValue.second
        }
    }
    
    func path(in rect: CGRect)->Path{
        return Path {path in
            let width = rect.width + (-offset.width > 0 ? offset.width : 0)
            
            path.move(to:CGPoint(x:0, y:0))
            path.addLine(to:CGPoint(x:rect.width,y:0))
            path.addLine(to:CGPoint(x:rect.width,y:rect.height))
            path.addLine(to:CGPoint(x:0,y:rect.height))
            
            let from = 80 + (offset.width)
            path.move(to: CGPoint(x:rect.width, y: from > 80 ? 80 : from))
            
            var to = 180 + (offset.height) + (-offset.width)
            to = to < 180 ? 180 : to
            let mid : CGFloat = 80 + ((to-80)/2)
            
            path.addCurve(to: CGPoint(x:rect.width, y:to), control1: CGPoint(x: width - currentPoint, y:mid), control2: CGPoint(x: width - currentPoint, y: mid))
        }
    }
}
