//
//  page1.swift
//  lab07
//
//  Created by User on 2021/5/5.
//

import SwiftUI

struct page1: View {
    @Binding var showPage1: Bool
    let text = ["羅德島製藥公司作為感染者問題專家，聘用感染者，深入危險地區，通過種種手段，已經成功解決了數起感染者引發的事件。", "而今將面對史無前例的感染者暴亂。", "在各個勢力間遊走，發掘不為人知的內幕，抵擋感染者的瘋狂進攻，玩家的決策將決定羅德島的方向。"]
    
    var body: some View {
        VStack{
            Text("源石")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.white)
            Image("Arknights02")
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

struct page1_Previews: PreviewProvider {
    static var previews: some View {
        page1(showPage1: .constant(true))
            .preferredColorScheme(.dark)
    }
}
