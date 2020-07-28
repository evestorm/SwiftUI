//
//  HomeList.swift
//  DesignCode
//
//  Created by evestorm on 2020/7/26.
//  Copyright © 2020 evelance. All rights reserved.
//

import SwiftUI

struct HomeList: View {
    @State var showCourseView = false
    
    var course = CourseData
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Courses")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        Text("22 course")
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.leading, 60)
                    
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30) {
                        ForEach(course) { item in
                            Button(action: {
                                self.showCourseView = true // 设置按钮点击动作
                            }) {
                                GeometryReader { geometry in
                                    // 把当前卡片设置为button的自定义外观
                                    CourseView(title: item.title, image: item.image, color: item.color, shadowColor: item.shadowColor)
                                        .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -40), axis: (x: 0, y: 10, z: 0))
    //                                Text(String(Double(geometry.frame(in: .global).minX))) // 当前包裹卡片的GeometryReader的x坐标相对整个屏幕的最小x值
                                }
                                .frame(width: 246, height: 360)
                            }.sheet(isPresented: self.$showCourseView) {
                                ContentView() // 弹出 contentView
                            }
                        }
                    }
                    .padding(.leading, 30)
                    .padding(.top, 30)
                    .padding(.bottom, 70)
                    Spacer()
                }
                .frame(height: 450)
                
                CertificateRow()
            }
            .padding(.top, 78.0)
        }
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}

struct CourseView: View {
    var title = "Build an app with SwiftUI"
    var image = "Card2"
    var color = Color("darkblue")
    var shadowColor = Color("darkblueshadow")
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(30)
                .lineLimit(4)
                .padding(.trailing, 30)
            Spacer()
            Image(image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 246)
                .padding(.bottom, 30)
        }
        .background(color)
        .cornerRadius(30)
        .frame(width: 246, height: 360)
        .shadow(color: shadowColor, radius: 20, x: 0, y: 20)
    }
}

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var color: Color
    var shadowColor: Color
}

let CourseData = [
    Course(
        title: "Build an app with SwiftUI",
        image: "Card2",
        color: Color("darkblue"),
        shadowColor: Color("darkblueshadow")
    ),
    Course(
        title: "Design Course",
        image: "Card3",
        color: Color("pink"),
        shadowColor: Color("pinkshadow")
    ),
    Course(
        title: "Swift UI Advanced",
        image: "Card4",
        color: Color("darkblue"),
        shadowColor: Color("darkblueshadow")
    ),
    Course(
        title: "Framer Playground",
        image: "Card5",
        color: Color("pink"),
        shadowColor: Color("pinkshadow")
    ),
    Course(
        title: "Flutter for Designers",
        image: "Card6",
        color: Color("darkblue"),
        shadowColor: Color("darkblueshadow")
    ),
]
