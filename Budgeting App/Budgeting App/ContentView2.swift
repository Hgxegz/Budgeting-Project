import SwiftUI
//create a class that will hold the values of the persons numberes
class FinancialDetails: ObservableObject {
    @Published var income: String
    @Published var saving: String
    @Published var house: String
    @Published var essent: String
    init(income: String, saving: String, house: String, essent: String) {
        self.income = income
        self.saving = saving
        self.house = house
        self.essent = essent
    }
}

extension UIScreen {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
}

//testing to see if the class can hold ints
class financialDetailsInt {
    var incomeInt: Int
    var savingInt: Int
    var houseInt: Int
    var essentInt: Int
    init(incomeInt: Int, savingInt: Int, houseInt: Int, essentInt: Int) {
        self.incomeInt = incomeInt
        self.savingInt = savingInt
        self.houseInt = houseInt
        self.essentInt = essentInt
    }
}


//THIS IS THE ACTUAL VIEW
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
                Color.black
                    .ignoresSafeArea()
                HStack(alignment: .center) {
                    Text("Monthly Income")
                        .font(.callout)
                        .foregroundColor(Color.white)
                        .bold()
                        .offset(y: -50)
                    TextField("Enter monthly income...", text: $monthlyIncome)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .offset(y: -50)
                }.padding()
                HStack(alignment: .center) {
                    Text("Saving Goal")
                        .foregroundColor(Color.white)
                        .font(.callout)
                        .bold()
                    TextField("Enter saving goal...", text: $savingGoal)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding()
                HStack(alignment: .center) {
                    Text("Housing/Utilities")
                        .foregroundColor(Color.white)
                        .font(.callout)
                        .bold()
                        .offset(y: 50)
                    TextField("Enter amount", text: $housing)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .offset(y: 50)
                }.padding()
                HStack(alignment: .center) {
                    Text("Essentials")
                        .foregroundColor(Color.white)
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
                
                //this is where the action happens when the button gets pressed
                if(pressed == true){
                    //these variables hold the int value of the string
                    //let monthlyInt = Int(monthlyIncome) ?? 0
                    //let savingsInt = Int(savingGoal) ?? 0
                    //let housingInt = Int(housing) ?? 0
                    //let essentialInt = Int(essential) ?? 0
                    let customer1 = FinancialDetails(income: monthlyIncome, saving: savingGoal, house: housing, essent: essential)
                    /*let customer2 = financialDetailsInt(incomeInt: Int(monthlyIncome) ?? 0, savingInt: Int(savingGoal) ?? 0, houseInt: Int(housing) ?? 0, essentInt: Int(essential) ?? 0) */
                    //let customer1monthlyIncome = Double(customer1.income)
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
                            Text(customer1.income)
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
                                .offset(y:-100)
                                
                        }
                        .offset(y:-350)
                    }
                    
                    /*let customer2 = financialDetailsInt(incomeInt: Int(monthlyIncome) ?? 0, savingInt: Int(savingGoal) ?? 0, houseInt: Int(housing) ?? 0, essentInt: Int(essential) ?? 0) */
                    /*NavigationLink(
                        destination: ContentView3(),
                            label: {
                                Text("done")
                                    .offset(y:200)
                            }) */
                        //.offset(y:200)
                        }
                 else {
                    Image("sad-cat-button")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .offset(y:200)
                }
            }
        }
}

//THIS SHOWS THE FIRST VIEW AND ASKS THE USER FOR THE INPUT
struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView2()
        }
    }
}

//NOW WE WILL DO THE CALCULATIONS AND TRY TO COVER THE LAST VIEW FUNCTION TO REPLACE IT INSTEAD OF CREATING A WHOLE NEW FOLDER

/*
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
                Text("This is another TEST")
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
} */
