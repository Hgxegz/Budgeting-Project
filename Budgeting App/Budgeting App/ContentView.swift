//
//  ContentView.swift
//  Test
//
//  Created by Devin Heng on 4/18/21.
//

import SwiftUI


struct ContentView: View {
    @State var pressed = false
    @State private var userName: String = ""
    @State private var passWord: String = ""
    
    var body: some View {
        NavigationView{
            ZStack {
                //Color.black
                    //.ignoresSafeArea()
                //logo and app name
                Image("budgeting-background")
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
                            .blur(radius: 10)
                appLogo()
                //company slogan
                sloganText()
                    Button("Start Budgeting") { //within this block is where you tell the button what you want it to do
                    pressed = true
                    } //this section describes what it will look like
                    .padding()
                    .background(Color(red: 0, green: 0, blue: 0.3))
                    .clipShape(Capsule())
                    .offset(y:0)
                if(pressed == true){
                    NavigationLink(
                        //destination: ContentView2(),
                        destination: ContentView2(),
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

struct sloganText: View {
    var body: some View {
        Text("Start saving smarter TODAY!")
            .font(.system(size: 20.0))
            .foregroundColor(.white)
            .offset(y:-100)
    }
}

struct appLogo: View {
    var body: some View {
        Image("logo")
            .resizable()
            .offset(y:-250)
            .frame(width:400.0, height: 400.0)
    }
}

struct LoginButtonContent: View {
    var body: some View{
        Text("Login")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 200, height: 30)
            .cornerRadius(35.0)
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.3))
            .clipShape(Capsule())
    }
}
