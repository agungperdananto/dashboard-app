//
//  Home.swift
//  Dashboard App
//
//  Created by Agung  Perdananto on 01/05/24.
//

import SwiftUI

struct Home: View {
//    Current Tab
    @State var currentTab: String = "home"
    
//    for matched geometry effect
    @Namespace var animation
    
    var body: some View {
        HStack(spacing: 0){
//            Side bar menu
            VStack(spacing: 20){
//                Menu Buttons
                ForEach(["home", "monitor", "bag", "card", "list"], id:\.self){ image in
                    MenuButton(image: image)
                }
               
                
            }
                .padding(.top, 60)
                .frame(width: 85)
                .frame(maxHeight: .infinity, alignment: .top)
                .background(
//                    Corner radius only on right side
                    ZStack{
                        Color.white.padding(.trailing, 30)
                        
                        Color.white.cornerRadius(15).shadow(color: Color.black.opacity(0.04), radius: 5, x: 5, y: 0)
                    }
                )
//            Home View
            VStack(spacing: 15){

                HStack{
                    VStack(alignment: .leading, spacing: 2){
                        Text("Dashboard").font(.title.bold())
                            .foregroundColor(.black)
                        Text("Payment updates").font(.callout).foregroundColor(.gray)
                        
                    }
                    Spacer()
//                    Search bar
                    HStack(spacing: 10){
                        Image(systemName: "magnifyingglass")
                            .font(.title3)
                            .foregroundColor(.black)
                        TextField("Search", text: .constant(""))
                            .frame(width: 150)
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal)
                    .background(Color.white)
                    .clipShape(Capsule())
                }
                
                ScrollView(.vertical, showsIndicators: false){
                    RecentsView()
                    
//                    Graph View
                    
                }
            }
            .padding(.horizontal, 30)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .top)
            
        }
        
        
//        Max Frame ...
        .frame(width: getRect().width / 1.75, height:getRect().height - 130, alignment: .leading)
        .background(Color.gray.opacity(0.05).ignoresSafeArea())
        
//        Appliying button style to whole view
        .buttonStyle(BorderlessButtonStyle())
        .textFieldStyle(PlainTextFieldStyle())
        
        
    }
    @ViewBuilder
    func MenuButton(image: String)->some View{
        Image(image).resizable().renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/).aspectRatio(contentMode: .fit)
            .foregroundColor(currentTab == image ? .black: .gray)
            .frame(width: 22, height: 22)
            .frame(width: 80, height: 50)
            .overlay(
                HStack{
                    if currentTab == image{
                        Capsule()
                            .fill(Color.black)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                            .frame(width: 2, height: 40)
                            .offset(x: 2)
                    }
                }, alignment: .trailing
            )
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation(.spring()){
                    currentTab = image
                }
            }
    }
    
    @ViewBuilder
    func RecentsView()->some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 15){
                ForEach(recents){
                    recent in
                    VStack(alignment: .leading, spacing: 15){
                        HStack{
                            Image(systemName: recent.image).resizable()
                                .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 26, height:26)
                                .foregroundColor(.black)
                            
                            Spacer()
                            Image("menu")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 16, height:16)
                                .foregroundColor(.gray)
                            
                        }
                        Text(recent.title)
                            .foregroundColor(.gray)
                        Text(recent.price)
                            .font(.title2.bold())
                            .foregroundColor(.black)
                    }
                    .padding()
                    .frame(width: 150)
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.03),radius: 5 , x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.03),radius: 5 , x: -5, y: -5)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

// Extending View to get screen Frame

extension View{
    func getRect()->CGRect {
        return NSScreen.main!.visibleFrame
    }
}
