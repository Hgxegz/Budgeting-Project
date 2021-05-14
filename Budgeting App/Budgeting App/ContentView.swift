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
                Color.black
                    .ignoresSafeArea()
                //logo and app name
                appLogo()
                //company slogan
                sloganText()
                //sign in message and input boxes
                Text("Sign In")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .offset(y:-75)
                VStack {
                        TextField(
                            "Username",
                             text: $userName)
                            .disableAutocorrection(true)
                            .padding(.top,30)
                            .padding(.bottom,30)
                            .padding(.leading, 50)
                            .padding(.trailing,50)
                        SecureField(
                            "Password",
                            text: $passWord)
                            .disableAutocorrection(true)
                            .padding(.top,0)
                            .padding(.leading, 50)
                            .padding(.trailing, 50)
                            .padding(.bottom, 0)
                        Button(action: {print("Button tapped")}) {
                            LoginButtonContent()
                        }
                            //button details
                            .offset(y:70)
                    }
                .offset(y:50)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                /*
                    Button("Start Budgeting") { //within this block is where you tell the button what you want it to do
                    pressed = true
                } //this section describes what it will look like
                    .padding()
                    .background(Color(red: 0, green: 0, blue: 0.3))
                    .clipShape(Capsule())
                    .offset(y:100)
                if(pressed == true){
                    NavigationLink(
                        //destination: ContentView2(),
                        destination: ContentView2(),
                        label: {
                            Text("Start Budgeting")
                            
                        })
                        .offset(y:100)
                } else {
                    /*Image("sad-cat-button")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .offset(y:200) */
                } */
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

struct sloganText: View {
    var body: some View {
        Text("Start saving smarter TODAY!")
            .font(.system(size: 20.0))
            .foregroundColor(.white)
            .offset(y:-150)
    }
}

struct appLogo: View {
    var body: some View {
        Image("logo")
            .resizable()
            .offset(y:-250)
            .frame(width:300.0, height: 300.0)
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
