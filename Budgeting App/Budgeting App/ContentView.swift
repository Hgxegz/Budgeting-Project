//
//  ContentView.swift
//  Test
//
//  Created by Devin Heng on 4/18/21.
//

import SwiftUI


struct ContentView: View {
    @State var showDetails = false
    
    var body: some View {
        ZStack {
            Image("budgeting-background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 10)
            Text("PENNY PINCHERS")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.white)
                .offset(y: -20)
            Text("Start saving smarter TODAY!")
                .font(.system(size: 20.0))
                .foregroundColor(.white)
                .offset(y:200)
            Image("Krabs")
                .resizable()
                .frame(width: 80.0, height: 80.0)
                .offset(y:-100)
            Button("Press Me") { //within this block is where you tell the button what you want it to do
                print("Button pressed!")
            } //this section describes what it will look like
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.2))
            .clipShape(Capsule())
            .offset(y:280)

        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
