//
//  FullScreenNavigationView.swift
//  login
//
//  Created by Siwar Nafti on 29/3/2023.
//

import SwiftUI

struct FullScreenNavigationView: View {
    @Binding var isShowing: Bool
    //@Binding var sense: Bool
    var edgeTransition: AnyTransition = .move(edge: .leading)
       var content: AnyView
   /* if(sense){
        edgeTransition = .move(edge:.leading)
    }
    else{
        edgeTransition = .move(edge: .trailing)
    }*/
    
       var body: some View {
           ZStack(alignment: .bottom) {
               if (isShowing) {
                   Color.black
                       .opacity(0.3)
                       .ignoresSafeArea()
                       .onTapGesture {
                           isShowing.toggle()
                       }
                   content
                       .transition(edgeTransition)
                       .background(
                           Color.white
                       )
               }
           }
           .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
           .ignoresSafeArea()
           .animation(.easeInOut, value: isShowing)
       }
}


