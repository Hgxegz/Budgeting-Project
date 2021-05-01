//
//  Budgeting_AppApp.swift
//  Budgeting App
//
//  Created by Devin Heng on 4/21/21.
//

import SwiftUI

@main
struct Budgeting_AppApp: App {
    //this property wrapper is in charge of keeping the object alive while the program is running
    //@StateObject var financialDetails = FinancialDetails(income: <#T##String#>, saving: <#T##String#>, house: <#T##String#>, essent: <#T##String#>)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                //.environmentObject(financialDetails)
        }
    }
}
