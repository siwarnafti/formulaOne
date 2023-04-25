//
//  TeamView.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 14/4/2023.
//

import SwiftUI

struct TeamView: View {
    var body: some View {
        ScrollView{
            ZStack{
                VStack{
                    ZStack{
                        Image("TeamCard1")
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedCorners(tl:10,tr:10,bl: 10,br:10))
                            .padding(7)
                        VStack{
                            HStack{
                                Image("Mercedes-Benzlogo")
                                    .resizable()
                                    .background(.red)
                                    .clipShape(Circle()).frame(width: 100,height: 100)
                                    .padding(7)
                                Spacer()
                            }
                            Spacer()
                        }.padding(7)
                        
                    }
                    Image("TeamCard2")
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedCorners(tl:10,tr:10,bl: 10,br:10))
                        .padding(7)
                }
            }
            
        }}
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView()
    }
}
