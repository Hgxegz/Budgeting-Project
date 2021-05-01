//
//  ContentView3.swift
//  Budgeting App
//
//  Created by Devin Heng on 5/1/21.
//

import Foundation
//
//  ContentView3.swift
//  Budgeting App
//
//  Created by Ethan Santos on 4/24/21.
//

import SwiftUI

//Used to get the dimensions for the screen and sizing
extension UIScreen {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
}

struct ContentView3: View {
    
    var body: some View {
        ZStack(alignment: .top) {
            HStack() {
                Text("Budget Summary")
                    .font(.callout)
                    .bold()
            }.padding()
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
            }
        }
    }
}

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView3()
        }
    }
}
