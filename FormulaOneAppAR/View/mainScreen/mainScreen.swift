//
//  mainScreen.swift
//  login
//
//  Created by Siwar Nafti on 26/3/2023.
//

import SwiftUI

struct mainScreen: View {
    @StateObject private var currentReactives = SetReactiveMethods()
       @State var tabSelected = 0
    var v = ErgastViewModel()
       init(){
           UITabBar.appearance().backgroundColor = .white
       }
       
       var body: some View {
           ZStack {
               //Spacer()
               TabView(selection: $tabSelected) {
                   
                   Home()
                       .tabItem {
                           Image(systemName: "house")
                       }
                       .tag(0)
                   
                   CarsView()
                       .tabItem {
                           Image(systemName: "car.2")
                       }
                       .tag(1)
                   
                   RealityKitView(carname: "formulaEsprit")
                       .tabItem {
                           Image(systemName: "camera")
                              // .imageScale(2)
                       }
                       .tag(2)
                   
                   SearchView()
                       .tabItem {
                           Image(systemName: "magnifyingglass.circle")
                       }
                       .tag(3)
                   
                   //Profil()
                   ProfileView()
                       .tabItem {
                           Image(systemName: "person.crop.circle")
                       }
                       .tag(4)
                   
               }
               .accentColor(Color("PrimaryColor"))
               FullScreenNavigationView(isShowing: $currentReactives.presentFullScreenView, content: AnyView(NavigationView { currentReactives.viewToShow.view }))
               
           }
           
       }
}
      
           

struct mainScreen_Previews: PreviewProvider {
    static var previews: some View {
        mainScreen()
    }
}


