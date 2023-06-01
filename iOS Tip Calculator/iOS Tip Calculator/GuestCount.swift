//
//  GuestCount.swift
//  iOS Tip Calculator
//
//  Created by Chris Tu on 5/31/23.
//

import SwiftUI

struct GuestCount: View {
    @Binding var guests: Int
    var body: some View {
        HStack(spacing: 20){ //you cna make this a custom view and set up in a cocoa pod and implement it in any project you want
            Button{ //SUBTRACT BUTTON
                if guests > 1{
                    guests -= 1 //can't have 0 guests
                }
            } label: {
                Image(systemName: "minus.circle") //from SF Symbols from Apple, public system images
                    .foregroundColor(Color(red:17/255, green: 122/255, blue:202/225))
                    .font(.system(.title, design: .rounded))
            }
            
            Text("\(guests)")
                .foregroundColor(.primary) //adaptive light and dark mode color
                .font(.system(size: 40, weight: .black, design: SwiftUI.Font.Design.monospaced))
            Button{ //no limit on guests
                guests += 1
            }label: {
                Image(systemName: "plus.circle") //from SF Symbols from Apple, public system images
                    .foregroundColor(Color(red:17/255, green: 122/255, blue:202/225))
                    .font(.system(.title, design: .rounded))
            }
                 
            
        }
    }
}

struct GuestCount_Previews: PreviewProvider {
    static var previews: some View {
        GuestCount(guests: .constant(1))
    }
}
