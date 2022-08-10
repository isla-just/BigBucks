//
//  Home.swift
//  BigBucks (iOS)
//
//  Created by Isla Just's Macbook Pro on 2022/08/03.
//


import SwiftUI

struct Home: View {
    @State private var showWelcomeView = false
    
    // MARK: - INTROS
    @State var intros: [Intro] = [
        Intro(title: "Join the family", logo:"logo2", subTitle: "learn how to manage your big bucks every month", description: "na", img: "Onboard1", color: Color("White"), accent: Color("DarkText")),
        
        Intro(title: "Track",logo:"logo1", subTitle: "track the spending of your big bucks every month", description: "na", img: "Onboard2", color: Color("Primary"), accent: Color("White")),
        
        Intro(title: "Spoil yourself!", logo:"logo2", subTitle: "spend your pocket money on the things you want the most", description: "na", img: "Onboard3", color: Color("White"), accent: Color("DarkText")),
    ]
    
    // MARK: - GESTURE PROPERTIES
    @GestureState var isDragging: Bool = false
    
    @State var fakeIndex: Int = 0
    @State var currentIndex: Int = 0
    
    var body: some View {
        

        ZStack {
            ForEach(intros.indices.reversed(), id: \.self){index in
                //Intro View
                IntroView(intro: intros[index])
                    .clipShape(LiquidShape(offset: intros[index].offset, curvePoint: fakeIndex == index ? 50 : 0))
                    .padding(.trailing, fakeIndex == index ? 0: 0)
                    .ignoresSafeArea()
            }
            

            HStack(spacing: 8) {
                ForEach(0..<intros.count - 2, id: \.self){index in
                    Circle()
                        .fill(Color("DarkText"))
                        .frame(width: 8, height: 8)
                        .scaleEffect(currentIndex == index ? 1.15 : 0.85)
                        .opacity(currentIndex == index ? 1 : 0.25)
                }
                
                Spacer()
       
                    Button(action: { showWelcomeView = true }){
                    
                    Text("Let's Start")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color("DarkText"))
                        .clipShape(Capsule())
                }
//                NavigationLink("", destination:  Login(), isActive: $showWelcomeView)
            }
           
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                
            
        }
        .overlay(
            
            Button(action: {
                
            }, label: {
                
                Image(systemName: "chevron.right")
                    .padding(.trailing, -10.0)
                    .padding(.top, 10.0)

                    .font(.title3)
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color("DarkText"))
                    .contentShape(Rectangle())
                    .gesture(
                    DragGesture()
                        .updating($isDragging, body: {value, out, _ in
                            out = true
                        })
                        .onChanged({ value in
                            withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.6, blendDuration: 0.6)){
                                intros[fakeIndex].offset = value.translation
                            }
                            
                        })
                        .onEnded({value in
                            withAnimation(.spring()){
                                if -intros[fakeIndex].offset.width >
                                        getRect().width / 2 {
                                    intros[fakeIndex].offset.width = -getRect().height * 1.5
                                    
                                    fakeIndex += 1
                                    
                                    // MARK: - UPDATE ORIGINAL INDEX
                                    if currentIndex == intros.count - 3 {
                                        currentIndex = 0
                                    } else {
                                        currentIndex += 1
                                    }
                                    
                                    // MARK: - RESETING INDEX
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                                        if fakeIndex == (intros.count - 2) {
                                            for index in 0..<intros.count - 2{
                                                intros[index].offset = .zero
                                            }
                                            
                                            fakeIndex = 0
                                        }
                                    }
                                    
                                } else {
                                    intros[fakeIndex].offset = .zero
                                }
                            }
                        })
                    )
                
            })
            .offset(y: 53)
            .opacity(isDragging ? 0 : 1)
            .animation(.linear, value: isDragging)
            
            
            ,alignment: .topTrailing
        )
        .onAppear{
            guard let first = intros.first else {
                return
            }
            
            guard var last = intros.last else {
                return
            }
            
            last.offset.width = -getRect().height * 1.5
            
            intros.append(first)
            intros.insert(last, at: 0)
            
            fakeIndex = 1
        }
    }
    
    @ViewBuilder
    func IntroView(intro: Intro)->some View {

        VStack {
            
            
            Image(intro.logo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, height: 57)
            
            Spacer()
            
            Image(intro.img)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 310, height: 310)
        
            
            VStack(alignment: .center, spacing: 10) {
                
                
                Text(intro.title)
                    .font(.system(size: 30, weight: .bold))
                    
                
                Text(intro.subTitle)
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
                  
    
            }
            
            .foregroundColor(intro.accent)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.leading, 20)
            .padding([.trailing, .top])
            
            Spacer()
            Spacer()
        }
        .padding(.top, 60.0)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            
            intro.color
          
        
        )
    }
}

// MARK: - VIEW ETENSION
extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct LiquidShape: Shape {
    var offset: CGSize
    var curvePoint: CGFloat
    
    // MARK: SHAPE ANIMATION
    var animatableData: AnimatablePair<CGSize.AnimatableData, CGFloat>{
        get{
            return AnimatablePair(offset.animatableData, curvePoint)
        }
        set{
            offset.animatableData = newValue.first
            curvePoint = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
            return Path{path in
                let width = rect.width + (-offset.width > 0 ? offset.width : 0)
                
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: rect.width, y: 0))
                path.addLine(to: CGPoint(x: rect.width, y: rect.height))
                path.addLine(to: CGPoint(x: 0, y: rect.height))
                
                // MARK: - FROM
                let from = 80 + (offset.width)
                path.move(to: CGPoint(x: rect.width, y: from > 80 ? 80 : from))
                
                // MAR: - TO
                var to = 180 + (offset.height) + (-offset.width)
                to = to < 180 ? 180 : to
                
                let mid : CGFloat = 80 + ((to - 80) / 2)
                
                path.addCurve(to: CGPoint(x: rect.width, y: to), control1: CGPoint(x: width - curvePoint, y: mid), control2: CGPoint(x: width - curvePoint, y: mid))
                
            }
        }
}
