//
//  CardView.swift
//
//
//  Created by Chris Tu on 5/31/23.
//

import SwiftUI

struct CardView: View {
    var labelText = ""
    var totalAmt = 48.85
    var subTotalAmt = 42.48
    var tipAmt = 6.37
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text(labelText)
                .foregroundColor(Color(red:17/255, green: 122/255, blue:202/225))
                .fontWeight(.black)
            ZStack {
                Rectangle()
                    .foregroundColor(.gray)
                    .cornerRadius(20)
                
                HStack{
                    Spacer()
                    
                    Text("$ \(totalAmt, specifier:"%.2f")")
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight:
                                .black, design: .monospaced))
                        .fontWeight(.black)
                    
                    Spacer()
                    
                    Rectangle()
                        .foregroundColor(Color(red:128/255, green: 128/255, blue:128/225))
                        .frame(width: 1,height: 70)
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 10){
                        VStack(alignment: .leading){ //subtotal
                            Text("Subtotal")
                                .font(.system(.caption, design: .rounded))
                                .fontWeight(.light)
                            Text("$ \(subTotalAmt, specifier: "%.2f")")
                                .font(.system(.body, design: .monospaced))
                                .fontWeight(.black)
                        }
                        
                        VStack(alignment: .leading){
                            Text("Tip")
                                .font(.system(.caption, design: .rounded))
                                .fontWeight(.light)
                            Text("$ \(tipAmt, specifier: "%.2f")")
                                .font(.system(.body, design: .monospaced))
                                .fontWeight(.black)
                        }
                    }
                    .foregroundColor(.white) //changes all Vstack Text to white
                    
                    Spacer()
                }
                .padding(5) //so they don't hug
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(labelText: "PER PERSON")
            .frame(width: 300, height: 150)
    }
}
