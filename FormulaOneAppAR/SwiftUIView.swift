//
//  SwiftUIView.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 22/4/2023.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
    }
    init(){
        for familyName in UIFont.familyNames
        {
            print(familyName)
            
            for fontName in UIFont.fontNames(forFamilyName: familyName){
                print("---\(fontName)")
            }
        }}
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
