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
        Button("Red Hat"){
            if self.profile.currency[0].amount >= 50{
                self.profile.currency[0].amount -= 50
            }
        }
    }
}

struct store_Previews: PreviewProvider {
    static var previews: some View {
        store(profile: profileInfo(debug: true))
    }
}
