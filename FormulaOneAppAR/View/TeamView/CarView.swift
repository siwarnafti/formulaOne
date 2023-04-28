//
//  CarView.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 21/4/2023.
//

import SwiftUI
import SceneKit
struct CarView: View {
    
   
    func getscene(scene : String)->SCNScene{
        var scene = SCNScene(named: scene)
        scene?.background.contents = UIImage(named: "ferrari_consturctorlogo")
        return scene!
    }
//    @State var index = 0
    var body: some View {
        ZStack{
            
            SceneView(scene: getscene(scene: "formula.usdz") , options: [.autoenablesDefaultLighting,.allowsCameraControl])
                        .padding()
            
        }.frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height/2)
            .cornerRadius(70)
            .shadow(radius: 2)
            .padding()
        
    }
}

struct CarView_Previews: PreviewProvider {
    static var previews: some View {
        CarView()
    }
}
/*View {
    ZStack{
        SceneView(scene: SCNScene(named: models[index].modelName!) , options: [.autoenablesDefaultLighting,.allowsCameraControl])
                    .padding()
                    
        HStack(){
            Button(action: {
                withAnimation{
                    if index > 0 {
                        index -= 1
                    }
                }
            }, label: {
                Image(systemName: "chevron.left")
                    .font(.system(size:35,weight:.bold))
//                        .opacity(index == models.count - 1 ? 0.3 : 1)
            })
            .disabled(index == 0 ? true : false)
            
            
            Spacer()
            
            
            Button(action: {
                withAnimation{
                    if index < models.count {
                        index += 1
                    }
                }
            }, label: {
                Image(systemName: "chevron.right")
                    .font(.system(size:35,weight:.bold))
//                        .opacity(index == models.count - 1 ? 0.3 : 1)
            })
            .disabled(index == models.count - 1 ? true : false)
            
            
            
            
        }.padding()
        VStack{
            HStack{
                Spacer()
                Image(systemName: "heart.fill")
                //                .resizable()
                    .scaleEffect(2)
                    .foregroundColor(.accentColor)
                    .padding()
//                        .offset(x:-10)
            }.padding()
            Spacer()
        }
    }.frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height/2)
        .shadow(radius: 2)
        .padding()
    
}
*/
