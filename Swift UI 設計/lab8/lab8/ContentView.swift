//
//  ContentView.swift
//  lab8
//
//  Created by User on 2021/5/12.
//

import SwiftUI

struct ContentView: View {
    var row = ["您工作辛苦了", "工作的時候一定要保持全神貫注", "羅德島全艦正處於通常航行狀態", "羅德島全艦正處於通常航行狀態"]
    
    @State private var birthday = Date()
    @State private var scale: CGFloat = 1
    @State private var selectPicker = 0
    @State private var update: Bool = false
    @State private var speak = 1
    @State private var inp: String = ""
    @State private var showAlert = false
    var body: some View {
        VStack{
            Text("Amiya")
                .padding()
            Image("Amiya")
                .scaleEffect(0.8)
                .frame(width: 200, height: 200, alignment: .center)
                .clipShape(Circle())
                .shadow(radius: 10)
            HStack{
                if update {
                    Text("升變")
                }
                    Toggle("升變", isOn:$update)
                        .labelsHidden()
                
            }
            DatePicker("生日：", selection: $birthday, displayedComponents: .date)
                .padding(.horizontal, 60.0)
            HStack{
                Text("台詞：")
                Picker(selection: $selectPicker, label: Text("台詞")) {
                    Text(row[0]).tag(0)
                    Text(row[1]).tag(1)
                    Text(row[2]).tag(2)
                    Text(row[3]).tag(3)
                }
            }
            HStack{
                Text("信賴度：")
                Slider(value: $scale, in: 0...100)
                Text("\(scale, specifier: "%.0f")")
                    .padding(.trailing)
            }
            Stepper("還不准睡喔！ x\(speak)", value: $speak)
            TextField("想說的話", text: $inp)
            
            Button("送出", action: {
                showAlert = true
            })
            .alert(isPresented: $showAlert) {
                        Alert(title: Text("Amiya"),
                              message: Text("生日：\(birthday)\n\(row[selectPicker])\n還不准睡喔！ x\(speak)\n\(inp)"),
                              dismissButton: .default(Text("OK")))
                    }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
