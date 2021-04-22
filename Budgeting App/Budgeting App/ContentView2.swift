import SwiftUI


struct ContentView2: View {
    @State var showDetails = false
    
    var body: some View {
        Text("This is the second page")
    }
}



struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView2()
        }
    }
}
