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
                //Color.black
                    //.ignoresSafeArea()
                //logo and app name
                //background image to show the app is about saving money
                Image("budgeting-background")
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
                            .blur(radius: 10)
                appLogo() //function to show the app logo
                //company slogan
                sloganText() //function to show the app slogan
                    Button("Start Budgeting") { //within this block is where you tell the button what you want it to do
                    pressed = true
                    } //this section describes what it will look like
                    .padding()
                    .background(Color(red: 0, green: 0, blue: 0.3))
                    .clipShape(Capsule())
                    .offset(y:0)
                if(pressed == true){
                    //if we press the button, then we direct to another view
                    NavigationLink(
                        //destination: ContentView2(),
                        destination: ContentView3(),
                        label: {
                            Text("Start Budgeting")
                            
                        })
                        .offset(y:0)
                }

            }
            .background(
                    Image("budgeting-background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                )
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

//creates a new view just for the text
struct sloganText: View {
    var body: some View {
        Text("Start saving smarter TODAY!")
            .font(.system(size: 20.0))
            .foregroundColor(.white)
            .offset(y:-100)
    }
}

//creates a new view to use image and show the logo
struct appLogo: View {
    var body: some View {
        Image("logo")
            .resizable()
            .offset(y:-250)
            .frame(width:400.0, height: 400.0)
    }
}
