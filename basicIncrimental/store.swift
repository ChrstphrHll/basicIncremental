//
//  store.swift
//  basicIncrimental
//
//  Created by Christopher Hall on 1/11/21.
//

import SwiftUI

struct store: View {
    @ObservedObject var profile: profileInfo
    
    var body: some View {
        HStack {
            VStack {
                //compress
                Button(action: {
                    if profile.useCurr(color: "red", cost: 50){
                        profile.currency[1].unlock()
                    }
                }){
                    tapper(name: "Buy Blue", color: .red)
                }
                
                Button(action: {
                    if profile.useCurr(color: "blue", cost: 50){
                        profile.currency[2].unlock()
                    }
                }){
                    tapper(name: "Buy Green", color: .blue)
                }
                
                Button(action: {
                    if profile.useCurr(color: "green", cost: 50){
                        profile.currency[3].unlock()
                    }
                }){
                    tapper(name: "Buy Purple", color: .green)
                }
                
                Button(action: {
                    if profile.useCurr(color: "purple", cost: 50){
                        profile.currency[4].unlock()
                    }
                }){
                    tapper(name: "Buy Black", color: .purple)
                }
            }
            
            
            VStack {
                //compress
                Button(action: {
                    if profile.useCurr(color: "red", cost: 50){
                        profile.currency[0].addHat()
                    }
                }){
                    tapper(name: "Buy Red Hat", color: .red)
                }
                
                Button(action: {
                    if profile.useCurr(color: "blue", cost: 50){
                        profile.currency[1].addHat()
                    }
                }){
                    tapper(name: "Buy Blue Hat", color: .blue)
                }
                
                Button(action: {
                    if profile.useCurr(color: "green", cost: 50){
                        profile.currency[2].addHat()
                    }
                }){
                    tapper(name: "Buy Green Hat", color: .green)
                }
                
                Button(action: {
                    if profile.useCurr(color: "purple", cost: 50){
                        profile.currency[3].addHat()
                    }
                }){
                    tapper(name: "Buy Purple Hat", color: .purple)
                }
                
                Button(action: {
                    if profile.useCurr(color: "black", cost: 50){
                        profile.currency[4].addHat()
                    }
                }){
                    tapper(name: "Buy Black Hat", color: .black)
                }
            }
        }
    }
}

struct store_Previews: PreviewProvider {
    static var previews: some View {
        store(profile: profileInfo(debug: true))
    }
}
