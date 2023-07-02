//
//  ContentView.swift
//  lab07
//
//  Created by User on 2021/5/5.
//

import SwiftUI

struct ContentView: View {
    @State private var showPage1 = false
    @State private var showPage2 = false
    
    let abarty = ["大地遭受起因不明的天災肆虐，經由天災席捲過的土地上出現了大量的神秘礦物——「源石」。", "隨著科技不斷進步，源石之內所蘊含的能量在投入工業後使得文明順利邁入現代，與此同時，源石本身也催生出「感染者」的存在。",    "「感染者」是身俱力量與不幸的存在，如今他們之中有一部分的人，妄圖與源石整合為一，為大地帶來新的秩序。"]
    
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        VStack{
            Text("Arknights")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.white)
            Image("Arknights01")
                .resizable()
                .padding(.bottom)
                .frame(height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            ForEach(0..<abarty.count){i in
                Text(abarty[i])
                    .foregroundColor(Color.white)
                    .padding(.bottom)
            }
            HStack{
                Button(action: {
                    showPage1 = true
                }, label: {
                    Image("Arknights02")
                        .resizable()
                        .scaledToFill()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .shadow(radius: 20)
                })
                .sheet(isPresented: $showPage1, content: {
                    ZStack{
                        Color.black
                            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        page1(showPage1: $showPage1)
                    }
                })
                
                Button(action: {
                    showPage2 = true
                }, label: {
                    Image("Arknights03")
                        .resizable()
                        .padding(.trailing, 3.0)
                        .scaledToFill()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .shadow(radius: 20)
                })
                .sheet(isPresented: $showPage2, content: {
                    ZStack{
                        Color.black
                            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        page2(showPages2: $showPage2)
                    }
                })
            }
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
