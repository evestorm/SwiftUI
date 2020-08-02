//
//  Home.swift
//  DesignCode
//
//  Created by evestorm on 2020/7/26.
//  Copyright © 2020 evelance. All rights reserved.
//

import SwiftUI

// 状态栏高度
let statusBarHeight = UIApplication.shared.windows[0].windowScene?.statusBarManager?.statusBarFrame.height ?? 0

let screen = UIScreen.main.bounds

struct Home: View {
    @State var show = false // 控制菜单滑出与隐藏
    @State var showProfile = false // 控制ContentView显示隐藏
    
    var body: some View {
        ZStack {
            
            HomeList()
                .blur(radius: show ? 20 : 0)
                .scaleEffect(showProfile ? 0.95 : 1)
                .animation(.default)
            
            ContentView()
                .frame(minWidth: 0, maxWidth: 712)
                .cornerRadius(30)
                .shadow(radius: 20)
                .animation(.spring())
                .offset(y: showProfile ? statusBarHeight + 30 : UIScreen.main.bounds.height)
            
            MenuButton(show: $show)
                .offset(x: -40, y: showProfile ? statusBarHeight : 80)
                .animation(.spring())
            
            MenuRight(show: $showProfile)
                .offset(x: -16, y: showProfile ? statusBarHeight : 88)
                .animation(.spring())
            
            MenuView(show: $show)
        }
        .background(Color("background"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Home().previewDevice("iPhone SE")
//            Home().previewDevice("iPhone Xr")
//            Home().previewDevice("iPad Pro (9.7-inch)")
        }
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
                .foregroundColor(.primary)
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
    Menu(title: "Settings", icon: "gear"),
    Menu(title: "Billing", icon: "creditcard"),
    Menu(title: "Team", icon: "person.and.person"),
    Menu(title: "Sign out", icon: "arrow.uturn.down"),
]

struct MenuView: View {
    var menu = menuData
    @Binding var show: Bool
    @State var showUpdate = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 30) {
                ForEach(menu) { item in
                    if (item.title == "Settings") {
                        Button(action: {
                            self.showUpdate.toggle()
                        }) {
                            MenuRow(image: item.icon, text: item.title)
                        }.sheet(isPresented: self.$showUpdate) {
                            Settings()
                        }
                    } else {
                        MenuRow(image: item.icon, text: item.title)
                    }
                }
                Spacer()
            }
            .padding(.top, 20)
            .padding(30)
            .frame(minWidth: 0, maxWidth: 360)
            .background(Color("button"))
            .cornerRadius(30)
            .padding(.trailing, 60)
            .shadow(radius: 20)
            .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 1, z: 0))
            .animation(.spring())
            .offset(x: show ? 0 : -UIScreen.main.bounds.width)
            .onTapGesture {
                self.show.toggle()
            }
            Spacer()
        }
        .padding(.top, statusBarHeight)
    }
}

struct CircleButton: View {
    var icon = "person.crop.circle"
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: icon)
                .foregroundColor(.secondary)
        }
        .frame(width: 40, height: 40)
        .background(Color("button"))
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
                            .foregroundColor(Color("secondary"))
                    }
                    .padding(.trailing, 18)
                    .frame(width: 90, height: 60)
                    .background(Color("button"))
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
    @State var showUpdate = false
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Spacer()
                Button(action: { self.show.toggle() }) {
                    CircleButton(icon: "person.crop.circle")
                }

                Button(action: {
                    self.showUpdate.toggle()
                }) {
                    CircleButton(icon: "bell")
                }.sheet(isPresented: $showUpdate) {
                    UpdateList()
                }
            }
            Spacer()
        }
    }
}
