//
//  ContentView.swift
//  lab10
//
//  Created by User on 2021/5/26.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct ContentView: View {
    @DocumentID var id: String?
    @State private var name = ""
    @State private var isfinish = ""
    @State private var endTime = Date()
    @State private var n = "無"
    @State private var f = "無"
    @State private var e = Date()
    @State private var isInput = false
    let timeFormatter = DateFormatter()
    
    var body: some View {
        VStack{
            Text("ToDO App")
                .font(.largeTitle)
                .padding(.bottom, 29.0)
            Text("輸數數據")
            HStack{
                Text("名稱：")
                TextField("請輸入名稱", text: $name)
                    .padding(.vertical)
            }
            HStack{
                Text("是否完成：")
                TextField("請輸入“是”或“否”", text: $isfinish)
                    .padding(.vertical)
            }
            DatePicker("到期時間：", selection: $endTime)
                .padding(.vertical)
            Button(action: {
                let dbID = CreateDate(name: name, isfinish: isfinish, endDate: endTime)
                let db = Firestore.firestore()
                db.collection("dateline").document("\(dbID)").getDocument { document, error in
                    guard let document = document, document.exists, let i = try? document.data(as: Dateline.self) else {
                        return
                    }
                    n = i.name
                    f = i.isfinish
                    e = i.endDate
                }
                isInput = true
            }, label: {
                Text("新增數據")
            })
            
            Text("-------------------------------------------------")
                .padding(.vertical)
            Text("目前數據")
                .padding(.vertical)
            Text("名稱：\(n)\n\n完成度：\(f)")
                .padding(.vertical)
            Text(isInput ? "到期時間：\(e)" : "到期時間：無")
                    .padding(.vertical)
        }
    }
    
    func CreateDate(name: String, isfinish: String, endDate: Date) -> String {
        let db = Firestore.firestore()
        let dateLine = Dateline(id: name ,name: name, isfinish: isfinish, endDate: endDate)
        var dbID: String = ""
        do {
            let doucumentReference = try  db.collection("dateline").addDocument(from: dateLine)
            print(doucumentReference.documentID)
            dbID = String(doucumentReference.documentID)
        } catch {
            print("error")
        }
        return dbID
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

