//
//  ContentView.swift
//  iOS Tip Calculator
//
//  Created by Chris Tu on 5/31/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmt = "" //check total
    @State private var people = 2 //guests
    @State private var tipPercent = 2 //tip fraction
    @FocusState private var isInputActive: Bool
    
    private let tipPercents = [0, 10, 15, 20, 25]
    
    private var subTotal: Double { Double(checkAmt) ?? 0 } //check if user passes something that can be converted to a double, otherwise set it to 0
    
    private var subTotalPerPerson: Double { //returns the subtotal amount per person
        let peopleCt = Double(people)
        let orderAmt = Double(checkAmt) ?? 0
        
        return orderAmt/peopleCt
    }
    
    private var tipValue: Double{ //returns the total tip
        let tipSelect =
            Double(tipPercents[tipPercent])
        let orderAmt = Double(checkAmt) ?? 0
        
        return orderAmt / 100 * tipSelect
    }
    
    private var tipPerPerson: Double {tipValue / Double(people) }
    
    private var totalAmtWithTip: Double {
        let tipSelect =
            Double(tipPercents[tipPercent]) //selected tip
        let orderAmt = Double(checkAmt) ?? 0 //the check
        let tipVal = orderAmt / 100 * tipSelect //the tip
        let finalTot = orderAmt + tipVal
        
        return finalTot
    }
    
    private var totalAmtPerPerson: Double {
        let peopleCt = Double(people)
        let amtPerPerson  = totalAmtWithTip / peopleCt
        
        return amtPerPerson
    }
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(red:17/255, green: 122/255, blue:202/225, alpha: 0.7) //navy blue RGBA color, alpha means opacity from 0.0 to 1.0
    } //makes sure UI segmenter that is instantiated later is navy blue, or any color I want
    
    
    
    var body: some View {
        GeometryReader{ geo in
            VStack(alignment: .center, spacing: 20){ //bringing cardview into Vstack of ContentView
                CardView(labelText: "PER PERSON", totalAmt: totalAmtPerPerson, subTotalAmt: subTotalPerPerson, tipAmt: tipPerPerson)
                    .frame(width: geo.size.width, height: 100)
                
                CardView(labelText: "TOTAL", totalAmt: totalAmtWithTip, subTotalAmt: subTotal, tipAmt: tipValue)
                    .frame(width: geo.size.width, height: 100)
                
                
                Picker("Tip Percentage", selection:
                        $tipPercent) {
                    ForEach(0..<tipPercents.count, id:\.self) {
                    /* fix from https://www.hackingwithswift.com/forums/swiftui/compiler-warning-non-constant-range-argument-must-be-an-integer-literal/14878*/
                    
                        Text("\(self.tipPercents[$0])%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle()) //picking from text array
                
                TitleView(title: "BILL AMOUNT") //extracted view struct practice, an 'extracted title view'
                //use command click to extract subview in xcode
                
                HStack {
                    Text("$")
                        .foregroundColor(.primary)
                        .font(.system(size: 60, weight: .black, design: .rounded))
                    
                    TextField("Amount", text: $checkAmt)
                        .foregroundColor(.primary)
                        .font(.system(size: 60, weight: .black, design: .rounded))
                        .keyboardType(.decimalPad)
                        .focused($isInputActive) //focus modifier
                    
                        .toolbar{
                            ToolbarItemGroup(placement: .keyboard){
                                Spacer()
                                Button("Done") {
                                    isInputActive = false
                                }
                            }

                        }
                }
                TitleView(title: "SPLIT")
                GuestCount(guests: $people) //binding to recieve value, in content view and specifies the amount of people
                
                
            
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TitleView: View {
    var title: String
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(Color(red:17/255, green: 122/255, blue:202/225))
                .fontWeight(.black)
            Spacer()
            
        }
    }
}
