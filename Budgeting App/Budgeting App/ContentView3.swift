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
    //initialize to 0.0 for when we convert to doubles
    @State var monthlyIncome: String = "0.0"
    @State var savingGoal: String = "0.0"
    @State var housing: String = "0.0"
    @State var essential: String = "0.0"
    @State var pressed: Int = 0
    var body: some View {
        ZStack {
            Color.black //background color of this page
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                //if the button has not been pressed then we don't do any action yet
                if(pressed == 0){
                    ContentView2(monthlyIncome: $monthlyIncome, savingGoal: $savingGoal,
                        housing: $housing,
                        essential: $essential,
                        pressed: $pressed)
                }
            }
            //we have to check if pressed == 2 so we dont show the chart if the user hasn't finished input yet
            if(pressed == 2){
                //convert strings to doubles and if it cant then it turns to 0
                let savingValue = Double(savingGoal) ?? 0
                let housingValue = Double(housing) ?? 0
                let essentialValue = Double(essential) ?? 0
                let income = Double(monthlyIncome) ?? 0
                
                //we are converting the input values with respect to a circle in order to match it with a chart
                let savingGoalArc: Double = ((savingValue * 360)/income)
                let housingArc: Double = ((housingValue * 360)/income)
                let essentialArc: Double = ((essentialValue * 360)/income)
                let sumValues: Double = savingValue+housingValue+essentialValue
                let remainder: Double = income-sumValues
                VStack {
                    //all the hstacks within this Vstack are to print out the results of the analysis
                    //also color coordinates the chart with the meaning so the user knows
                    Text("RESULTS!")
                        .font(.system(size: 20.0))
                        .foregroundColor(.white)
                    HStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 15, height: 15)
                        Text("Income: $" + monthlyIncome)
                            .foregroundColor(.white)
                    }
                    HStack {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 15, height: 15)
                        Text("Saving Goal: $" + savingGoal)
                            .foregroundColor(.blue)
                    }
                    HStack {
                        Circle()
                            .fill(Color.yellow)
                            .frame(width: 15, height: 15)
                        Text("Housing Spending: $" + housing)
                            .foregroundColor(.yellow)
                    }
                    HStack {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 15, height: 15)
                        Text("Essential Spending: $" + essential)
                            .foregroundColor(.red)
                    }
                    HStack {
                        Circle()
                            .fill(Color.green)
                            .frame(width: 15, height: 15)
                        Text("Money left to spend: $" + "\(remainder)")
                            .foregroundColor(.green)
                    }
                //creates the arc for the pie chart using the function to create the arc with the user input as the parameters
                ZStack {
                    makeArc(rad: 100, start: 360, end: 0.0).fill(Color.green) //the entire pie to indicate the remainder
                    makeArc(rad: 100, start: 360, end: 360 - savingGoalArc).fill(Color.blue)
                    makeArc(rad: 100, start: 360 - savingGoalArc, end:360 - (savingGoalArc + housingArc)).fill(Color.yellow)
                    makeArc(rad: 100, start: 360 - (savingGoalArc + housingArc), end: 360 - (savingGoalArc + housingArc + essentialArc)).fill(Color.red)
                }.offset(y:-245)
            }
            }

        }
    }
}

//Function to make an arbitrary arc, specified in parameters with radius, starting angle, and ending angle
func makeArc(rad: Double, start: Double, end: Double) -> Path {
    //Makes a path which makes an arc and returns that path
    let newArc = Path { path in
        path.move(to: CGPoint(x: UIScreen.screenWidth/2, y: UIScreen.screenHeight/2))
        path.addArc(center: .init(x: UIScreen.screenWidth/2, y: UIScreen.screenHeight/2), radius: CGFloat(rad), startAngle: Angle(degrees: start), endAngle: Angle(degrees: end), clockwise: true)
    }
    return newArc
}

struct ContentView2: View {
    //binding the variables from the ones we defined earlier so we can change with user input
    @Binding var monthlyIncome: String
    @Binding var savingGoal: String
    @Binding var housing: String
    @Binding var essential: String
    @Binding var pressed: Int
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            //setting up text fields for the user to enter values
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
        //if this button is pressed, then the value will change to 2 and make the actual chart
        Button(action: {
                pressed = 2
        }, label: {
            Text("Button")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(Color.blue)
                .cornerRadius(30)
        })
        //if pressed value is 1 then we direct into the view that asks for the inputs
        if(pressed == 1){
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
