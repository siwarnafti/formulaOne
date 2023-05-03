//
//  modeView.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 30/4/2023.
//

import SwiftUI

struct modeView: View {
//    @State private var languageIndex = 0
    @State private var selectedLanguage = "en"
    
    let languages = [
        ("en", "English"),
        ("fr", "French")
   
    ]
    
    var body: some View {
       
       
       
                VStack {
                    Text(LocalizedStringKey("Hello, World!"))
                    Picker(selection: $selectedLanguage, label: Text("SelectLanguage")) {
                        ForEach(languages, id: \.0) { language in
                            Text(language.1).tag(language.0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                }
//                .onAppear {
//                    // Set the initial language on app launch
//                    let savedLanguage = UserDefaults.standard.string(forKey: "SelectedLanguage")
//                    self.selectedLanguage = savedLanguage ?? "en"
//                    Bundle.main.setLanguage(self.selectedLanguage)
//                }
//                .onChange(of: selectedLanguage) { newValue in
//                    print("SelectedLanguage: \(newValue)")
//                    // Update the selected language and save it to user defaults
//                    self.selectedLanguage = newValue
//                    UserDefaults.standard.set(self.selectedLanguage, forKey: "SelectedLanguage")
//                    UserDefaults.standard.synchronize()
//
//                    // Update the app's language
//                    Bundle.main.setLanguage(self.selectedLanguage)
//                    print("Bundle Language: \(Bundle.main.preferredLocalizations.first!)")
//

                }
            }
//        }


struct modeView_Previews: PreviewProvider {
    static var previews: some View {
        modeView()
    }
}

extension Bundle {
    func setLanguage(_ languageCode: String) {
        let path = Bundle.main.path(forResource: languageCode, ofType: "lproj") ?? ""
        let bundle = Bundle(path: path)
        object_setClass(self, bundle.map { type(of: $0) } ?? Bundle.self)
    }
    
}
