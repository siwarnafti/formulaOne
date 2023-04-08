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
    
       init(){
           UITabBar.appearance().backgroundColor = .white
       }
       
       var body: some View {
           ZStack {
               //Spacer()
               TabView(selection: $tabSelected) {
                   
                   Text("home")
                       .tabItem {
                           Image(systemName: "house")
                       }
                       .tag(0)
                   
                   Text("Search")
                       .tabItem {
                           Image(systemName: "flag.checkered")
                       }
                       .tag(1)
                   
                   Text("home")
                       .tabItem {
                           Image(systemName: "camera")
                              // .imageScale(2)
                       }
                       .tag(2)
                   
                   Text("home")
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


