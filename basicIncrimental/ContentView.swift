//
//  ContentView.swift
//  basicIncrimental
//
//  Created by Christopher Hall on 1/2/21.
//

import SwiftUI

struct Inventory: Codable{
    var red: Int
    var blu: Int
}

class profileInfo: ObservableObject{
    @Published var currency: Inventory{
        didSet{
            let encoder = JSONEncoder()
            if let saved = try? encoder.encode(currency){
                UserDefaults.standard.set(saved, forKey: "saved")
            }
        }
    }
    
    init(){
        if let saveData = UserDefaults.standard.data(forKey: "saved"){
            let decoder = JSONDecoder()
            if let loaded = try? decoder.decode(Inventory.self, from: saveData){
                self.currency = loaded
                return
            }
        }
        
        self.currency = Inventory(red: 0, blu: 0)
    }
}

struct ContentView: View {
    @ObservedObject var inven = profileInfo()
    
    var body: some View {
        VStack {
            Text("Red: \(inven.currency.red) Blu: \(inven.currency.blu)")
                .padding()
            
            HStack{
                Button(action: {
                    self.inven.currency.red += 1
                }, label: {
                    Text("Red")
                        .foregroundColor(.white)
                        .frame(width: 100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.red)
                        .cornerRadius(10)
                })
                
                Button(action: {
                    self.inven.currency.blu += 1
                }, label: {
                    Text("Blu")
                        .foregroundColor(.white)
                        .frame(width: 100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
