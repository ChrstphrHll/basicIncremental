//
//  tapper.swift
//  basicIncrimental
//
//  Created by Christopher Hall on 1/3/21.
//

import SwiftUI

struct tapper: View {
    let name: String
    let color: Color
    
    var body: some View {
        Text("\(name)")
            .foregroundColor(.white)
            .frame(maxWidth: 100, maxHeight: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(color)
            .cornerRadius(10)
    }
}

struct tapper_Previews: PreviewProvider {
    static var previews: some View {
        tapper(name: "TEST", color: Color.purple)
    }
}
