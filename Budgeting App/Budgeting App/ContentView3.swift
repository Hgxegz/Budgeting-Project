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
    @State var pressed: Int = 0
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                if(pressed == 0){
                    ContentView2(monthlyIncome: $monthlyIncome, savingGoal: $savingGoal,
                        housing: $housing,
                        essential: $essential,
                        pressed: $pressed)
                }
                if(pressed == 2){
                    Text("RESULTS")
                        .font(.system(size: 20.0))
                        .foregroundColor(.white)
                        .offset(y:-200)
                    ZStack() {
                    Path { path in
                        path.move(to: CGPoint(x: UIScreen.screenWidth/2, y: UIScreen.screenHeight/2))
                        path.addArc(center: .init(x: UIScreen.screenWidth/2, y: UIScreen.screenHeight/2), radius: 100, startAngle: Angle(degrees: 0.0), endAngle: Angle(degrees: 290), clockwise: true)
                    }.fill(Color.green)
                    Path { path in
                        path.move(to: CGPoint(x: UIScreen.screenWidth/2, y: UIScreen.screenHeight/2))
                        path.addArc(center: .init(x: UIScreen.screenWidth/2, y: UIScreen.screenHeight/2), radius: 100, startAngle: Angle(degrees: 290), endAngle: Angle(degrees: 180), clockwise: true)
                    }.fill(Color.yellow)
                    Path { path in
                        path.move(to: CGPoint(x: UIScreen.screenWidth/2, y: UIScreen.screenHeight/2))
                        path.addArc(center: .init(x: UIScreen.screenWidth/2, y: UIScreen.screenHeight/2), radius: 100, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 100), clockwise: true)
                    }.fill(Color.blue)
                    Path { path in
                        path.move(to: CGPoint(x: UIScreen.screenWidth/2, y: UIScreen.screenHeight/2))
                        path.addArc(center: .init(x: UIScreen.screenWidth/2, y: UIScreen.screenHeight/2), radius: 100, startAngle: Angle(degrees: 100), endAngle: Angle(degrees: 80), clockwise: true)
                    }.fill(Color.pink)
                    Path { path in
                        path.move(to: CGPoint(x: UIScreen.screenWidth/2, y: UIScreen.screenHeight/2))
                        path.addArc(center: .init(x: UIScreen.screenWidth/2, y: UIScreen.screenHeight/2), radius: 100, startAngle: Angle(degrees: 80), endAngle: Angle(degrees: 0), clockwise: true)
                    }.fill(Color.purple)
                   /* Text(customer1.income)
                        .offset(y:-75)
                        .foregroundColor(Color.white)
                    Text(customer1.saving)
                        .foregroundColor(Color.white)
                        .offset(y:-50)
                    Text(customer1.house)
                        .foregroundColor(Color.white)
                        .offset(y:-25)
                    Text(customer1.essent)
                        .foregroundColor(Color.white)
                        .offset(y:-100) */
                        
                }
                .offset(y:-100)
                }
            }
        }
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
