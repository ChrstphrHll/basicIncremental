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
    var hats: Int
    
    init(_ quick: String){
        name = quick
        amount = 0
        
        if quick == "red"{
            unlocked = true
        } else {
            unlocked = false
        }
        
        hats = 0
    }
    
    mutating func addHat(){
        self.hats += 1
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
    
    //v similar to above getColor func; possibly integrate into one struct
    func useCurr(color: String, cost: Int)->Bool{
        var type = 0
        switch color{
        case "red":
            type = 0
        case "blue":
            type = 1
        case "green":
            type = 2
        case "purple":
            type = 3
        case "black":
            type = 4
        default:
            type = -1
        }
        
        if self.currency[type].amount >= cost{
            self.currency[type].amount -= cost
            return true
        } else {
            return false
        }
    }
    
    init(debug: Bool = false){
        
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
        
        if debug {
            for num in 0..<self.currency.count{
                self.currency[num].unlock()
            }
        }
    }
}

struct ContentView: View {
    @ObservedObject var profile = profileInfo()
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                //Text("Red: \(profile.currency[0].amount) Blu: \(profile.currency[1].amount)")
                //    .padding()
                
                tapperPanel(prof: profile)
                
                Spacer()
                
                store(profile: profile)
            }
            
            HStack{
                Text("red hats: \(profile.currency[0].hats)")
                Text("blu hats: \(profile.currency[1].hats)")
                Text("grn hats: \(profile.currency[2].hats)")
                Text("prl hats: \(profile.currency[3].hats)")
                Text("blk hats: \(profile.currency[4].hats)")
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
