//
//  UpdateDetail.swift
//  DesignCode
//
//  Created by evestorm on 2020/7/27.
//  Copyright © 2020 evelance. All rights reserved.
//

import SwiftUI

struct UpdateDetail: View {
    
    var title = "SwiftUI"
    var text = "Loading..."
    var image = "background2"
    
    var body: some View {
        VStack(spacing: 20.0) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.heavy)
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(text)
                .lineLimit(nil) // 设置文本无限行数
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
        .padding(30)
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
