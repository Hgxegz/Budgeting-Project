//
//  ContentView2.swift
//  bindingTest
//
//  Created by Devin Heng on 5/16/21.
//

import SwiftUI

extension UIScreen {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
}

struct ContentView3: View {
    
    //these variables are to hold the user inputs
    @State var monthlyIncome: String = ""
    @State var savingGoal: String = ""
    @State var housing: String = ""
    @State var essential: String = ""
    @State var pressed: Bool = false
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                Text(monthlyIncome)
                    .foregroundColor(.white)
                Text(savingGoal)
                    .foregroundColor(.white)
                Text(housing)
                    .foregroundColor(.white)
                Text(essential)
                    .foregroundColor(.white)
                if(pressed == false){
                    ContentView2(monthlyIncome: $monthlyIncome, savingGoal: $savingGoal,
                        housing: $housing,
                        essential: $essential,
                        pressed: $pressed)
                }
                }
            }
        }
    }

struct ContentView2: View {
    @Binding var monthlyIncome: String
    @Binding var savingGoal: String
    @Binding var housing: String
    @Binding var essential: String
    @Binding var pressed: Bool
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            HStack(alignment: .center) {
                    Text("Monthly Income")
                        .font(.callout)
                        .foregroundColor(Color.white)
                        .bold()
                        .offset(y: -250)
                    TextField("Enter monthly income...", text: $monthlyIncome)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .offset(y: -250)
                }.padding()
                HStack(alignment: .center) {
                    Text("Saving Goal")
                        .foregroundColor(Color.white)
                        .font(.callout)
                        .bold()
                        .offset(y: -200)
                    TextField("Enter saving goal...", text: $savingGoal)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .offset(y: -200)
                }.padding()
                HStack(alignment: .center) {
                    Text("Housing/Utilities")
                        .foregroundColor(Color.white)
                        .font(.callout)
                        .bold()
                        .offset(y: -150)
                    TextField("Enter amount", text: $housing)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .offset(y: -150)
                }.padding()
                HStack(alignment: .center) {
                    Text("Essentials")
                        .foregroundColor(Color.white)
                        .font(.callout)
                        .bold()
                        .offset(y: -100)
                    TextField("Enter amount", text: $essential)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .offset(y: -100)
                }.padding()
        Button(action: {
                pressed = true
        }, label: {
            Text("Button")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(Color.blue)
                .cornerRadius(30)
        })
        if(pressed == true){
            NavigationLink(
                //destination: ContentView2(),
                destination: ContentView3(),
                label: {
                    Text("Start Budgeting")
                    
                })
                .offset(y:0)
        }
    }
}
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}
