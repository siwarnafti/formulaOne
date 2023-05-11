import SwiftUI
import SwiftUIX

struct Equip: Identifiable {
    let id = UUID()
    let name: String
    let team: String
    let location: String
    let round: Int
}

struct SearchView: View {
    @State private var searchText = ""
    
    let equips = [
        Equip(name: "Ferrari", team: "Ferrari", location: "Italy", round: 11),
        Equip(name: "Red Bull Racing", team: "Red Bull Racing", location: "Austria", round: 11),
        Equip(name: "McLaren", team: "McLaren Racing", location: "United Kingdom", round: 11),
        Equip(name: "Alpine", team: "Alpine F1 Team", location: "France", round: 11),
        Equip(name: "AlphaTauri", team: "Scuderia AlphaTauri", location: "Italy", round: 11),
        Equip(name: "Aston Martin", team: "Aston Martin Cognizant F1 Team", location: "United Kingdom", round: 11),
        Equip(name: "Williams", team: "Williams Racing", location: "United Kingdom", round: 11),
        Equip(name: "Alfa Romeo", team: "Alfa Romeo Racing", location: "Switzerland", round: 11),
        Equip(name: "Haas", team: "Haas F1 Team", location: "United States", round: 11),
    ]
    
    var filteredEquips: [Equip] {
        if searchText.isEmpty {
            return equips
        } else {
            return equips.filter { equip in
                equip.name.localizedCaseInsensitiveContains(searchText) || String(equip.round).localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack{
                
//                Color .
//                    .edgesIgnoringSafeArea(.all)
                
                VStack( spacing: 0) {
                    
                    List(filteredEquips) { equip in
                        VStack(alignment: .leading) {
                            Text(equip.name)
                                .font(.headline)
                            Text(equip.team)
                                .font(.subheadline)
                            Text(equip.location)
                                .font(.subheadline)
                            Text("Round: \(equip.round)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                              
                        }
                       
                    }
                   
                    .listStyle(.plain)
                    .searchable(text: $searchText) // search bar
                    .navigationTitle("Equips")
                    .background(Image("backgroundcolor4")
                    .resizable()
                    .frame(width: 450, height: 840)
                    .offset(x:0,y:0)
                    .ignoresSafeArea(.all)
)
                    
                }
            }
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
