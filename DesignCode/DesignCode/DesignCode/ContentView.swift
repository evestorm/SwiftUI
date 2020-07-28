//
//  ContentView.swift
//  DesignCode
//
//  Created by evestorm on 2020/7/19.
//  Copyright © 2020 evelance. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: 设置动画状态
    @State var show = false
    // MARK: 设置view状态
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            
            BlurView(style: .systemMaterial)
            
            TitleView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
            CardBottomView()
            .blur(radius: show ? 20 : 0)
            .animation(.default)
            
            CardView()
                .background(show ? Color.red : Color.blue)
                .cornerRadius(10.0)
                .shadow(radius: 20.0)
                .offset(x: 0, y: show ? -400 : -40)
                .scaleEffect(0.85)
                .rotationEffect(Angle(degrees: show ? 15 : 0))
                //                .rotation3DEffect(Angle(degrees: show ? 50 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
                .blendMode(.hardLight)
                .animation(.easeOut(duration: 0.7))
                .offset(x: viewState.width, y: viewState.height)
            CardView()
                .background(show ? Color.blue : Color("primary"))
                .cornerRadius(10.0)
                .shadow(radius: 20.0)
                .offset(x: 0, y: show ? -200 : -20)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
                //                .rotation3DEffect(Angle(degrees: show ? 40 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
                .animation(.easeOut(duration: 0.5))
                .offset(x: viewState.width, y: viewState.height)
                .blendMode(.hardLight)
            
            CertificateView()
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 5 : 0))
                //                .rotation3DEffect(Angle(degrees: show ? 30 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
                //response：控制动画持续时间
                //dampingFraction：阻尼控制,0代表永远反弹，大于1不会反弹
                .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0))
                .onTapGesture {
                    self.show.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            self.viewState = value.translation
                            self.show = true
                        })
                        .onEnded({ value in
                            self.viewState = CGSize.zero
                            self.show = false
                        })
                )
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            Text("Cark Back")
        }
        .frame(width: 340.0, height: 280.0)
    }
}

struct CertificateView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("UI Design")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("accent"))
                        .padding(.top)
                    Text("Certificate")
                        .foregroundColor(Color.white)
                    
                }
                Spacer()
                Image("Logo1")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
            }
            .padding(.horizontal)
            Spacer()
            Image("Card1")
        }
        .frame(width: 340.0, height: 280.0)
        .background(Color.black)
        .cornerRadius(10.0)
        .shadow(radius: 20)
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Spacer()
            }
            Image("Background1")
            Spacer()
        }
    }
}

struct CardBottomView: View {
    var body: some View {
        VStack(spacing: 20.0) {
            Rectangle()
                .frame(width: 60.0, height: 6.0)
                .cornerRadius(3.0)
                .opacity(0.1)
            Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
                .lineLimit(10)
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .padding(.horizontal)
        .background(BlurView(style: .systemMaterial))
        .cornerRadius(30.0)
        .shadow(radius: 30)
        .offset(x: 0, y: 600)
    }
}
