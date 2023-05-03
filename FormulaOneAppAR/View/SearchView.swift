//
//  SearchView.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 30/4/2023.
//

import SwiftUI
/*
struct User: Identifiable {
    var id = UUID()
    var name: String
}

struct SearchView: View {
    @State private var searchText = ""
    @State private var sortAscending = true
    
    let users = [
        User(name: "Alice"),
        User(name: "Bob"),
        User(name: "Charlie"),
        User(name: "Dave"),
        User(name: "Emily")
    ]
    
    var filteredUsers: [User] {
        if searchText.isEmpty {
            return users
        } else {
            return users.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    z
    var sortedUsers: [User] {
        if sortAscending {
            return filteredUsers.sorted { $0.name < $1.name }
        } else {
            return filteredUsers.sorted { $0.name > $1.name }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, placeholder: "Search Users")
                
                Toggle("Sort Ascending", isOn: $sortAscending)
                
                List(sortedUsers) { user in
                    VStack(alignment: .leading) {
                        Text(User.name)
                            .font(.headline)
                    }
                }
            }
            .navigationTitle("Users")
        }
    }
}

struct SearchBar: UIViewRepresentable {
    @Binding var text: String
    var placeholder: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = placeholder
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
*/
