//
//  RingView.swift
//  DesignCode
//
//  Created by evestorm on 2020/8/2.
//  Copyright © 2020 evelance. All rights reserved.
//

import SwiftUI

struct RingView: View {
    var color1 = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
    var color2 = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    var width: CGFloat = 300
    var height: CGFloat = 300
    var percent: CGFloat = 88 // 百分比
    var mulitiplier: CGFloat {
        return width / 44
    }  // 缩放比例(计算属性)
    var progress: CGFloat {
        return 1 - percent / 100
    }
    
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            Circle().stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5 * mulitiplier))
                .frame(width: width, height: height)
            Circle()
                .trim(from: show ? progress : 1, to: 1)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color(color1), Color(color2)]), startPoint: .topTrailing, endPoint: .bottomLeading), style: StrokeStyle(lineWidth: 5 * mulitiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0))
            .rotationEffect(Angle(degrees: 90)) // 顺时针旋转90度
            .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0)) // 沿x轴旋转180度
                .frame(width: width, height: height)
                .shadow(color: Color(color2).opacity(0.1), radius: 3 * mulitiplier, x: 0, y: 3 * mulitiplier)
            Text("\(Int(percent))%")
                .font(.system(size: 14 * mulitiplier))
                .fontWeight(.bold)
                .onTapGesture {
                    self.show.toggle()
            }
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(show: .constant(true))
    }
}
