import SwiftUI


struct ContentView2: View {
    //these variables are to hold the user inputs
    @State var monthlyIncome: String = ""
    @State var savingGoal: String = ""
    @State var housing: String = ""
    @State var essential: String = ""
    
    //this is for the button
    @State var pressed = false

        var body: some View {
            ZStack {
                HStack(alignment: .center) {
                    Text("Monthly Income:")
                        .font(.callout)
                        .bold()
                        .offset(y: -50)
                    TextField("Enter monthly income...", text: $monthlyIncome)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .offset(y: -50)
                }.padding()
                HStack(alignment: .center) {
                    Text("Saving Goal:")
                        .font(.callout)
                        .bold()
                    TextField("Enter saving goal...", text: $savingGoal)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding()
                HStack(alignment: .center) {
                    Text("Housing/Utilities:")
                        .font(.callout)
                        .bold()
                        .offset(y: 50)
                    TextField("Enter amount", text: $housing)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .offset(y: 50)
                }.padding()
                HStack(alignment: .center) {
                    Text("Groceries/Essentials:")
                        .font(.callout)
                        .bold()
                        .offset(y: 100)
                    TextField("Enter amount", text: $essential)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .offset(y: 100)
                }.padding()
                
                Button("Get Breakdown") { //within this block is where you tell the button what you want it to do
                    pressed = true
                } //this section describes what it will look like
                    .padding()
                    .background(Color(red: 0, green: 0, blue: 0.3))
                    .clipShape(Capsule())
                .offset(y: 200)
                
                
                if(pressed == true){
                    NavigationLink(
                        destination: ContentView2(),
                        label: {
                            Text(monthlyIncome)
                                .offset(y:-250)
                            Text(savingGoal)
                                .offset(y:-200)
                            Text(housing)
                                .offset(y:-150)
                            Text(essential)
                                .offset(y:-100)
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



struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView2()
        }
    }
}
