//
//  ContentView.swift
//  WeSplit
//
//  Created by Murat Han on 27.03.2020.
//  Copyright © 2020 mracipayam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    
    let tipPercentages = [10,15,20,25,0]
    var totalPerPerson : Double {
        //calculate the total per person here
        let peopleCount = Double(Int(numberOfPeople) ?? 0 + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    var totalAmount : Double {
        let amount = Double(checkAmount) ?? 0
        let tipSelection = Double(tipPercentages[tipPercentage])
        let tipValue = amount / 100 * tipSelection
        let totalAmount = amount + tipValue
        
        return totalAmount
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad) // i like it
                    
                    /*Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }*/
                    TextField("Number Of People",text: $numberOfPeople)
                        .keyboardType(.decimalPad)
                }
                //I like header feature, it looks so good!
                Section(header: Text("How much tip do you want to leave?")){
                    Picker("Tip Percentage",selection: $tipPercentage){
                        ForEach(0 ..< tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle()) // i love it
                }
                Section(header : Text("Amount per person")){
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                Section(header : Text("Total Amount")){
                    Text("$\(totalAmount, specifier: "%.2f")")
                }
            }
        .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
