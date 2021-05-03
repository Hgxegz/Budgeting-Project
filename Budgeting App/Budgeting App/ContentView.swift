//
//  ContentView.swift
//  Test
//
//  Created by Devin Heng on 4/18/21.
//

import SwiftUI


struct ContentView: View {
    @State var pressed = false
    
    var body: some View {
        NavigationView{
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
                    .offset(y: -150)
                Text("Start saving smarter TODAY!")
                    .font(.system(size: 20.0))
                    .foregroundColor(.white)
                    .offset(y:-70)
                Button("Start Budgeting") { //within this block is where you tell the button what you want it to do
                    pressed = true
                } //this section describes what it will look like
                    .padding()
                    .background(Color(red: 0, green: 0, blue: 0.3))
                    .clipShape(Capsule())
                
                if(pressed == true){
                    NavigationLink(
                        //destination: ContentView2(),
                        destination: ContentView2(),
                        label: {
                            Text("done")
                        })
                } else {
                    Image("sad-cat-button")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .offset(y:200)
                }
            }
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
