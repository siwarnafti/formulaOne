//
//  FormulaOneAppARApp.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 8/4/2023.
//
import SwiftUI

@main
struct FormulaOneAppARApp: App {
    let user=User()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
            //EditProfil()
            //Profil()
            //mainScreen()
            //SignInScreenView()
//            ProfileView()
//            EditProfil()
            SplashScreen()
//                .environmentObject(user)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
