//
//  ContentView.swift
//  lab05
//
//  Created by User on 2021/4/28.
//

import SwiftUI

struct ContentView: View {
    @State var dieNum1 = 1
    @State var dieNum2 = 1
    @State var dieNum3 = 1
    @State var money = 1000
    @State var userGuess = ""
    @State var guessFin = ""
    var body: some View {
        VStack{
            HStack{
                VStack{
                    Image(systemName: "die.face.\(dieNum1).fill").resizable()
                        .frame(width: 80, height: 80)
                    Text("骰子數字：\(dieNum1)")
                }
                
                VStack{
                    Image(systemName: "die.face.\(dieNum2).fill").resizable()
                        .frame(width: 80, height: 80)
                    Text("骰子數字：\(dieNum2)")
                }
                VStack{
                    Image(systemName: "die.face.\(dieNum3).fill")
                    .resizable()
                        .frame(width: 80, height: 80)
                    Text("骰子數字：\(dieNum3)")
                }
            }
                .padding()
            TextField("Input Number", text: $userGuess)
                .frame(width: 300, height: 30)
            
            Button(action: {
                dieNum1 = Int.random(in: 1...6)
                dieNum2 = Int.random(in: 1...6)
                dieNum3 = Int.random(in: 1...6)
                if Int(userGuess)! >= (dieNum1+dieNum2+dieNum3){
                    money += 100
                    guessFin = "猜測結果：成功＋100元"
                } else {
                    money -= 100
                    guessFin = "猜測結果：失敗-100元"
                }
            }, label: {
                Text("Guess")
                    .padding(.all)
            })
            Text("目前金額：\(money)元")
                .padding(.vertical)
            Text(guessFin != "" ? guessFin : "猜測結果：猜測中")
                .padding(.vertical)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
