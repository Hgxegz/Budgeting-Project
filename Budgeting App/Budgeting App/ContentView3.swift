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
    @State var monthlyIncome: String = "0.0"
    @State var savingGoal: String = "0.0"
    @State var housing: String = "0.0"
    @State var essential: String = "0.0"
    @State var pressed: Int = 0
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                if(pressed == 0){
                    ContentView2(monthlyIncome: $monthlyIncome, savingGoal: $savingGoal,
                        housing: $housing,
                        essential: $essential,
                        pressed: $pressed)
                }
            }
            //da tingggga
            //let values = [Double(savingGoal) ?? 0, Double(housing) ?? 0, Double(essential) ?? 0]
            if(pressed == 2){
                let savingValue = Double(savingGoal) ?? 0
                let housingValue = Double(housing) ?? 0
                let essentialValue = Double(essential) ?? 0
                let income = Double(monthlyIncome) ?? 0
                
                let savingGoalArc: Double = ((savingValue * 360)/income)
                let housingArc: Double = ((housingValue * 360)/income)
                let essentialArc: Double = ((essentialValue * 360)/income)
                let sumValues: Double = savingValue+housingValue+essentialValue
                let remainder: Double = income-sumValues
                VStack {
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
                ZStack {
                    makeArc(rad: 100, start: 360, end: 0.0).fill(Color.green) //the entire pie to indicate the remainder
                    makeArc(rad: 100, start: 360, end: 360 - savingGoalArc).fill(Color.blue)
                    makeArc(rad: 100, start: 360 - savingGoalArc, end:360 - (savingGoalArc + housingArc)).fill(Color.yellow)
                    makeArc(rad: 100, start: 360 - (savingGoalArc + housingArc), end: 360 - (savingGoalArc + housingArc + essentialArc)).fill(Color.red)
                }.offset(y:-245)
               /* makeArc(rad: 100, start: 0.0, end: (numerator-((housingValue * 360)/income))).fill(Color.blue) */
            }
            }

        }
    }
}

func makeArc(rad: Double, start: Double, end: Double) -> Path {
    let newArc = Path { path in
        path.move(to: CGPoint(x: UIScreen.screenWidth/2, y: UIScreen.screenHeight/2))
        path.addArc(center: .init(x: UIScreen.screenWidth/2, y: UIScreen.screenHeight/2), radius: CGFloat(rad), startAngle: Angle(degrees: start), endAngle: Angle(degrees: end), clockwise: true)
    }
    return newArc
}

struct ContentView2: View {
    @Binding var monthlyIncome: String
    @Binding var savingGoal: String
    @Binding var housing: String
    @Binding var essential: String
    @Binding var pressed: Int
    
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
                pressed = 2
        }, label: {
            Text("Button")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(Color.blue)
                .cornerRadius(30)
        })
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
