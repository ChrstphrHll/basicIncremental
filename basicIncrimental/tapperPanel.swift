//
//  tapperPanel.swift
//  basicIncrimental
//
//  Created by Christopher Hall on 1/4/21.
//

import SwiftUI

struct tapperPanel: View {
    @ObservedObject var prof: profileInfo
    
    var body: some View {
        VStack {
            ForEach(0 ..< prof.currency.count) { number in
                let element = prof.currency[number]
                if element.unlocked {
                    Button(action:{
                        prof.currency[number].increment()
                    }){
                        HStack {
                            tapper(name: element.name, color: element.getColor())
                            
                            Text("\(element.amount)")
                        }
                        .padding(1)
                    }
                }
            }
        }
    }
}

struct tapperPanel_Previews: PreviewProvider {
    static var previews: some View {
        tapperPanel(prof: profileInfo(debug: true))
    }
}
