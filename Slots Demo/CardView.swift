//
//  CardView.swift
//  Slots Demo
//
//  Created by Kuiduan Zeng on 12/29/20.
//

import SwiftUI

struct CardView: View {
    
    @Binding var symbol:String
    @Binding var background:Color
    
    
    var body: some View {
        Image(symbol)
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding(10)
            .background(background.opacity(0.5))
            .cornerRadius(20)
            .frame(width: 80, height: 80, alignment: .center)
            
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(symbol: Binding.constant("icecream"), background: Binding.constant(Color.green))
    }
}
