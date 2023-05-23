//
//  RoundInformationView.swift
//  FormulaOneAppAR
//
//  Created by Apple Esprit on 3/5/2023.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct RoundInformationView: View {
    //@State private var selection = 0
    @State private var qrCodeData: String = ""
    var race : Rrace
    var body: some View {
            ZStack{
                Color.gray
                    .ignoresSafeArea()
                    VStack{
                        Image(race.city)
                            .resizable()
                                                .padding(10)
                            .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/2.5)
                            .cornerRadius(50)
                            .shadow(radius: 10)
                        
                        //                .padding()
                        
                        
                        HStack{
                            Text("Round").font(
                                .custom(
                                    "AmericanTypewriter",
                                    fixedSize: 34)
                                .weight(.black))
                            Spacer()
                            Text(race.date)
                                .font(.custom("VastShadow-Regular", size: 34))
                                .fontWeight(.bold)
                        }.padding([.top, .leading, .trailing])
                        HStack{
                            Text("\(race.round)")
                                .font(.custom("VastShadow-Regular", size: 54))
                                .fontWeight(.bold)
                                .padding(.horizontal, 20)
                            Spacer()
                            
                        }
                        
                        
                        HStack{
                            VStack(alignment:.leading){
                                Text("Base").font(.custom("Sarpanch-Regular", size: 24))
                                Text(race.country).font(.custom("Sarpanch-Bold", size: 24))
                            }
                            Spacer()
                            NavigationLink(
                                destination: localisationView(base: race.city),
                                label: {
                                    Image(race.country)
                                        .resizable()
                                        .frame(width: 100,height: 50)
                                        .cornerRadius(20)
                                        .shadow(radius: 10)
                                    
                                })
                            
                           
                           
                        }.padding(.horizontal)
                        
                        HStack{
                            VStack(alignment:.leading){
                                Text("city").font(.custom("Sarpanch-Regular", size: 24))
                                Text(race.city).font(.custom("Sarpanch-Bold", size: 24))
                            }
                            Spacer()
                            QRCodeView(data: qrCodeData)
                                        .frame(width: 100, height: 100).onAppear {
                                            qrCodeData = "\(race.city)\n\(race.round)\n\(race.date)"
                                        }
                           
                        }.padding(.horizontal)
                        
                      
                        
                
                    }.offset(y:-40)
               
        }
       
    }
}

struct RoundInformationView_Previews: PreviewProvider {
    static var previews: some View {
        RoundInformationView(race: racess[0])
    }
}

struct QRCodeView: View {
    let data: String
    
    var body: some View {
        let filter = CIFilter.qrCodeGenerator()
        let data = Data(self.data.utf8)
        filter.setValue(data, forKey: "inputMessage")
        let ciImage = filter.outputImage
        
        let context = CIContext()
        guard let cgImage = context.createCGImage(ciImage!, from: ciImage!.extent) else {
            fatalError("Failed to create CGImage from CIImage.")
        }
        let uiImage = UIImage(cgImage: cgImage)
        
        return Image(uiImage: uiImage)
            .interpolation(.none)
            .resizable()
            .scaledToFit()
    }
}

