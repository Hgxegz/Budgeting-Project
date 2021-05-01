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
                    
                    let customer2 = financialDetailsInt(incomeInt: Int(monthlyIncome) ?? 0, savingInt: Int(savingGoal) ?? 0, houseInt: Int(housing) ?? 0, essentInt: Int(essential) ?? 0)
                    //NavigationLink(
                        //destination: ContentView2(),
                        //label: {
                        Text(customer1.income)
                            .offset(y:-250)
                            .foregroundColor(Color.white)
                        Text(customer1.saving)
                            .foregroundColor(Color.white)
                            .offset(y:-200)
                        Text(customer1.house)
                            .foregroundColor(Color.white)
                            .offset(y:-150)
                        Text(customer1.essent)
                            .foregroundColor(Color.white)
                            .offset(y:-100)
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



struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView2()
        }
    }
}
