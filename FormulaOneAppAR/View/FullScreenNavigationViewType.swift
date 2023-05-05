//
//  FullScreenNavigationViewType.swift
//  login
//
//  Created by Siwar Nafti on 29/3/2023.
//

import SwiftUI

enum FullScreenNavigationViewType {
    case empty
    case editview
    case WelcomeView
    //case localisationView
    
    var view: AnyView {
        switch self {
        case .empty:
            return AnyView(EmptyView())
        case .editview:
            return AnyView(EditProfil(editVM: EditProfileVM(), prfileVM: ProfileVM()))
        case .WelcomeView:
            return AnyView(WelcomeScreenView())
       // case .localisationView:
        //    return AnyView(localisationView())
            
        }
    }
}


