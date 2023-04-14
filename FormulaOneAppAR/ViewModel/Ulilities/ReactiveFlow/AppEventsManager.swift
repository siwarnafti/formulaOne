//
//  AppEventsManager.swift
//  login
//
//  Created by Siwar Nafti on 29/3/2023.
//

import SwiftUI
import Combine

final public class AppEventsManager {
    static let shared = AppEventsManager()
    /// Present a view over the tab bar
    var navigateFullScreen = PassthroughSubject<(Bool, FullScreenNavigationViewType), Never>()

}

