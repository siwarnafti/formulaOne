//
//  CustomsecuretextfieldView.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 11/4/2023.
//



import Foundation
import SwiftUI

struct PasswordView: View {
    
    var leftIcon : String

    var placeHolder : String

    
    @State private var isEditing = false
    @State private var edges = EdgeInsets(top: 0, leading:45, bottom: 0, trailing: 0)
    
    
    private enum Field : Int, Hashable {
        case fieldName
    }
    
    @Binding var password: String
    @State private var secured = true
    
    @FocusState private var focusField : Field?
    var body: some View {
        ZStack(alignment : .leading) {
            ZStack{
                
                
                if secured{
                    SecureField(placeHolder,text:$password)
                        .font(.title3)
                        .padding()
                    //                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(50.0)
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                        .padding(.vertical)
                }
                
                else{
                    TextField(placeHolder, text: $password)
                        .font(.title3)
                        .padding()
                    //                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(50.0)
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                        .padding(.vertical)
                    
                        .focused($focusField, equals: .fieldName)
                    
                }
                HStack{
//                    Image(systemName: leftIcon)
//                        .foregroundColor(Color.secondary)
                    Spacer()
                    Button {
                        secured.toggle()
                    } label: {
                        Image(systemName: secured ? "eye.slash" : "eye")
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }.padding()
//                .overlay(RoundedCorners(tl: 20, tr: 5, bl: 5, br: 20).stroke(lineWidth: 1).foregroundColor(.gray))
                
            }
 
        }
    } }

