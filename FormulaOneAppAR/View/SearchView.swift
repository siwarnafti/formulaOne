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
        Equip(name: "Equip 1", team: "Team A", location: "Location X", round: 11),
        Equip(name: "Equip 2", team: "Team B", location: "Location Y", round: 2),
        Equip(name: "Equip 3", team: "Team C", location: "Location Z", round: 3),
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
            VStack( spacing: 0) {
                List(filteredEquips) { equip in
                    VStack(alignment: .leading) {
                        Text(equip.name)
                            .font(.headline)
                            .foregroundColor(.red)
                        Text(equip.team)
                            .font(.subheadline)
                            .foregroundColor(.red)
                        Text(equip.location)
                            .font(.subheadline)
                            .foregroundColor(.red)
                        Text("Round: \(equip.round)")
                            .font(.subheadline)
                            .foregroundColor(.red)
                    }
                    .listRowBackground(Color.white)
                }
                .listStyle(.plain)
                .searchable(text: $searchText) // search bar
                .navigationTitle("Equips")
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray]), startPoint: .top, endPoint: .bottom)
     
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
