//
//  ContentView.swift
//  lab09
//
//  Created by User on 2021/5/19.
//

import SwiftUI

struct ContentView: View {
    @StateObject var gameViewModel = GameViewModel()
    var body: some View {
        VStack(spacing: 70){
            Text("猜拳遊戲")
                .font(.title)
                .padding(.bottom)
            
            HStack{
                Text("玩家： ")
                    .font(.title2)
                Image(gameViewModel.pi)
                    .resizable()
                    .frame(width: 100, height: 100)
                Text(gameViewModel.player?.rank.rawValue ?? "石頭")
                    .font(.title2)
                    .padding(.leading)
            }
            
            HStack{
                Text("電腦： ")
                    .font(.title2)
                Image(gameViewModel.ci)
                    .resizable()
                    .frame(width: 100, height: 100)
                Text(gameViewModel.computer?.rank.rawValue ?? "石頭")
                    .font(.title2)
                    .padding(.leading)
            }
            
            ZStack{
                Text("出拳！")
                    .foregroundColor(.blue)
                Button(action: {
                    gameViewModel.start()
                }, label: {
                    Image("paperscissorstone")
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .center)
                })
            }
            
            if gameViewModel.result == .win {
                Text("玩家勝利")
                    .font(.title2)
            } else if (gameViewModel.result == .lose){
                Text("玩家失敗")
                    .font(.title2)
            } else if (gameViewModel.result == .tie) {
                Text("平手")
                    .font(.title2)
            } else {
                Text("請按“出拳”開始猜拳")
                    .font(.title2)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
