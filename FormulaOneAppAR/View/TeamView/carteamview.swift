//
//  carteamview.swift
//  FormulaOneAppAR
//
//  Created by MacOS on 27/4/2023.
//

import SwiftUI

struct carteamview: View {
    let constructorModel : ConstructorModel
    var body: some View {
        /*ZStack{
            Image("Mercedes-Benzlogo")
                .resizable()
                .scaledToFit()
                .clipShape(RoundedCorners(tl:30,tr:30,bl: 30,br:30))
                .padding(7)
            HStack{
                VStack{
                    
                    
                    Text("1st")
                        .font(
                            .custom(
                                "RacingSansOne-Regular",
                                fixedSize: 24)
                            .weight(.black))
                        .foregroundColor(.white)
                        .padding(7)
                    Text("345pts")
                        .font(
                            .custom(
                                "RacingSansOne-Regular",
                                fixedSize: 24)
                            .weight(.black))
                        .foregroundColor(.white)
                    
                }.padding()
                Spacer()
                
            }
            
        }*/
        ZStack{
            Image("backtemview")
                .resizable()
                .scaledToFit()
                .clipShape(RoundedCorners(tl:30,tr:30,bl: 30,br:30))
            Image(constructorModel.carImage)
                .resizable()
                .scaledToFit()
                .frame(width: 350)
                //.offset(x:50)
            VStack{
                HStack(){
                    Image(constructorModel.logo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                    VStack(alignment: .leading){
                        Text("TEAM")
                            .font(
                                .custom(
                                    "RacingSansOne-Regular",
                                    fixedSize: 14)
                                .weight(.black))
                            .foregroundColor(.white)
                           
                        Text(constructorModel.teamname)
                            .font(
                                .custom(
                                    "RacingSansOne-Regular",
                                    fixedSize: 18)
                                .weight(.black))
                            .foregroundColor(.white)
                    }
                    Spacer()
                    
                }.padding(.top, 31.0)
                    .padding(.leading, 12.0)
                HStack{
                    VStack{
                        if constructorModel.rank == "1"{
                            Text("1ST").font(
                                .custom(
                                    "RacingSansOne-Regular",
                                    fixedSize: 24)
                                .weight(.black))
                            .foregroundColor(.white)
                        }
                        else if constructorModel.rank == "2"{
                                Text("2ND").font(
                                    .custom(
                                        "RacingSansOne-Regular",
                                        fixedSize: 24)
                                    .weight(.black))
                                .foregroundColor(.white)
                            }
                            else{
                                Text("\(constructorModel.rank)th").font(
                                    .custom(
                                        "RacingSansOne-Regular",
                                        fixedSize: 24)
                                    .weight(.black))
                                .foregroundColor(.white)
                            }
                        
                       
                            
                            
                        Text("\(constructorModel.point)pts")
                            .font(
                                .custom(
                                    "RacingSansOne-Regular",
                                    fixedSize: 24)
                                .weight(.black))
                            .foregroundColor(.white)
                    }
                    Spacer()
                }.padding(.horizontal)
                Spacer()
            }
        }.padding(7)
    }
}

