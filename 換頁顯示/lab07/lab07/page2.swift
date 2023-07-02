//
//  page2.swift
//  lab07
//
//  Created by User on 2021/5/5.
//

import SwiftUI

struct page2: View {
    @Binding var showPages2: Bool
    let text = ["無種族立場，極端排外的感染者組織。","他們宣稱感染者應對自己的身份感到驕傲，積極去獲取並使用屬於自己的力量。", "試圖用最原始的手段去爭奪世界的公正。以某座被摧毀的偉大城市為開端，醫療機構羅德島的突然介入，令整個事態向著未知發展。"]
    var body: some View {
        VStack{
            Text("整合運動")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.white)
            Image("Arknights03")
                .resizable()
                .padding(.bottom)
                .frame(height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            ForEach(text.indices){i in
                Text(text[i])
                    .foregroundColor(Color.white)
            }
        }
    }
}

struct page2_Previews: PreviewProvider {
    static var previews: some View {
        page2(showPages2: .constant(true))
            .preferredColorScheme(.dark)
    }
}
