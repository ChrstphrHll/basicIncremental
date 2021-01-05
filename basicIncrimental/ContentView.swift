//
//  ContentView.swift
//  basicIncrimental
//
//  Created by Christopher Hall on 1/2/21.
//

import SwiftUI

struct currencyType: Codable, Identifiable{
    var name: String
    var amount: Int
    var unlocked: Bool
    var id = UUID()
    
    init(_ quick: String){
        name = quick
        amount = 0
        unlocked = false
    }
    
    func getColor()->Color{
        switch self.name {
        case "red":
            return Color.red
        case "blue":
            return Color.blue
        case "green":
            return Color.green
        case "purple":
            return Color.purple
        case "black":
            return Color.black
        default:
            return Color.gray
        }
    }
    
    mutating func unlock(){
        self.unlocked = true
    }
    
    mutating func increment(){
        self.amount += 1
    }
}


class profileInfo: ObservableObject{
    @Published var currency: [currencyType]{
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
            if let loaded = try? decoder.decode([currencyType].self, from: saveData){
                self.currency = loaded
                return
            }
        }
        
        self.currency = [currencyType("red"),
                         currencyType("blue"),
                         currencyType("green"),
                         currencyType("purple"),
                         currencyType("black")]
    }
}

struct ContentView: View {
    @ObservedObject var profile = profileInfo()
    
    var body: some View {
        VStack {
            Text("Red: \(profile.currency[0].amount) Blu: \(profile.currency[1].amount)")
                .padding()
            
            tapperPanel(prof: profile)
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
