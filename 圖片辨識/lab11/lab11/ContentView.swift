//
//  ContentView.swift
//  lab11
//
//  Created by User on 2021/6/4.
//

import SwiftUI

struct ContentView: View {
    
    //let photos = ["wolf","tank","warship"]
    @State private var currentIndex: Int = 0
    @State private var classificationLabel: String = "Click Classify"
    @State private var classificationLabel2: String = "Click Classify"
    
    let model = MyImageClassifier_1()
    let model2 = SqueezeNet()
    
    private func ImageClassification() {
        let currentImageName = "\(currentIndex)"
        guard let img = UIImage(named: currentImageName),
              let resizedImage = img.resizeTo(size: CGSize(width: 299, height: 299)),
              let buffer = resizedImage.toBuffer()
        else{return}
        
        let output = try? model.prediction(image: buffer)
        if let output = output {
            //self.classificationLabel = output.classLabel
            let results1 = output.classLabelProbs.sorted{$0.1>$1.1}
            let result1 = results1.map{(key, value) in if (value>0.5){ return ("\(key) = \(value*100)%")} else {return ""}}.joined(separator: "\n")
            classificationLabel = result1
        }
        
        guard let img = UIImage(named: currentImageName),
              let resizedImage = img.resizeTo(size: CGSize(width: 227, height: 227)),
              let buffer = resizedImage.toBuffer()
        else{return}
        let output2 = try? model2.prediction(image: buffer)
        if let output2 = output2 {
            let results2 = output2.classLabelProbs.sorted{$0.1>$1.1}
            let result2 = results2.map{(key, value) in return "\(key) = \(value*100)%"}.joined(separator: "\n")
            classificationLabel2 = result2
        }
    }
    
    var body: some View {
        VStack {
            Image("\(currentIndex)")
                .resizable(capInsets: EdgeInsets())
                .frame(width: 200, height: 200)
            HStack {
                Button("Previous"){
                    if self.currentIndex > 0 {
                        self.currentIndex = self.currentIndex - 1
                    }
                    else{
                        self.currentIndex = 8
                    }
                    self.classificationLabel = "Click Classify"
                    self.classificationLabel2 = "Click Classify"
                    }.padding()
                    .foregroundColor(Color.white)
                    .background(Color.gray)
                    .cornerRadius(10)
                    .frame(width: 100)
                
                Button("Next") {
                    if self.currentIndex < 8 {
                        self.currentIndex = self.currentIndex + 1
                    }
                    else{
                        self.currentIndex = 0
                    }
                    self.classificationLabel = "Click Classify"
                    self.classificationLabel2 = "Click Classify"
                }.padding()
                .foregroundColor(Color.white)
                .frame(width: 100)
                .background(Color.gray)
                .cornerRadius(10)
            }.padding()
            
            Button("Classify") {
                // classify the image here
                self.ImageClassification()                
            }.padding()
            .foregroundColor(Color.white)
            .background(Color.green)
            .cornerRadius(8)
            
            HStack{
                Text("My Model:\n\(classificationLabel)")
                    .padding()
                Text("SqueezeNet:\n\(classificationLabel2)")
                    .padding()
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
