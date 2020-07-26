//
//  Home.swift
//  DesignCode
//
//  Created by evestorm on 2020/7/26.
//  Copyright © 2020 evelance. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var show = false // 控制菜单滑出与隐藏
    @State var showProfile = false // 控制ContentView显示隐藏
    
    var body: some View {
        ZStack {
            ContentView()
                .background(Color.white)
                .cornerRadius(30)
                .shadow(radius: 20)
                .animation(.spring())
                .offset(y: showProfile ? 60 : UIScreen.main.bounds.height)
            
            MenuButton(show: $show)
                .offset(x: -30, y: showProfile ? 0 : 80)
                .animation(.spring())
            
            MenuRight(show: $showProfile)
                .offset(x: -16, y: showProfile ? 0 : 88)
                .animation(.spring())
            
            MenuView(show: $show)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct MenuRow: View {
    var image = "creditcard"
    var text = "My Account"
    var body: some View {
        HStack {
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(Color("background2"))
                .frame(width: 32, height: 32)
            Text(text)
                .font(.headline)
            Spacer()
        }
    }
}

struct Menu: Identifiable {
    var id = UUID()
    var title: String
    var icon: String
}

let menuData = [
    Menu(title: "My Account", icon: "person.crop.circle"),
    Menu(title: "Billing", icon: "creditcard"),
    Menu(title: "Team", icon: "person.and.person"),
    Menu(title: "Sign out", icon: "arrow.uturn.down"),
]

struct MenuView: View {
    var menu = menuData
    @Binding var show: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            ForEach(menu) { item in
                MenuRow(image: item.icon, text: item.title)
            }
            Spacer()
        }
        .padding(.top, 20)
        .padding(30)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .padding(.trailing, 60)
        .shadow(radius: 20)
        .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 1, z: 0))
        .animation(.spring())
        .offset(x: show ? 0 : -UIScreen.main.bounds.width)
        .onTapGesture {
            self.show.toggle()
        }
    }
}

struct CircleButton: View {
    var icon = "person.crop.circle"
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: icon)
                .foregroundColor(.black)
        }
        .frame(width: 40, height: 40)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: Color("background2"), radius: 10, x: 0, y: 10)
    }
}

struct MenuButton: View {
    @Binding var show: Bool
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: { self.show.toggle() }) {
                    HStack {
                        Spacer()
                        Image(systemName: "list.dash")
                            .foregroundColor(.black)
                    }
                    .padding(.trailing, 20)
                    .frame(width: 90, height: 60)
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(color: Color("background2"), radius: 10, x: 0, y: 10)
                }
                Spacer()
            }
            Spacer()
        }
    }
}

struct MenuRight: View {
    @Binding var show: Bool
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Spacer()
                Button(action: { self.show.toggle() }) {
                    CircleButton(icon: "person.crop.circle")
                }
                Button(action: { self.show.toggle() }) {
                    CircleButton(icon: "bell")
                }
            }
            Spacer()
        }
    }
}
