//
//  profileeView.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 30/4/2023.
//

import SwiftUI

struct profileeView: View {
    var body: some View {
       
       
                ScrollView {
                    VStack(spacing: 0) {
                        // Profile header
                        HStack(spacing: 20) {
                            Image("profile_picture")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Username")
                                    .font(.title)
                                    .bold()
                                Text("Bio")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                HStack(spacing: 20) {
                                    VStack(spacing: 2) {
                                        Text("123")
                                            .font(.headline)
                                            .bold()
                                        Text("Posts")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                    VStack(spacing: 2) {
                                        Text("456")
                                            .font(.headline)
                                            .bold()
                                        Text("Followers")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                    VStack(spacing: 2) {
                                        Text("789")
                                            .font(.headline)
                                            .bold()
                                        Text("Following")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                        }
                        .padding()
                        
                        // Profile actions
                        HStack(spacing: 40) {
                            Button(action: {
                                // Handle action
                            }) {
                                Text("Edit Profile")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                            }
                            
                            Button(action: {
                                // Handle action
                            }) {
                                Image(systemName: "gearshape")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 20)
//                                            .stroke(Color.gray, lineWidth: 1)
//                                    )
                            }
                        }
                        .padding(.horizontal, 20)
                        
                        // Profile content
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 1) {
                            ForEach(0..<9) { index in
                                Image("post_\(index)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: (UIScreen.main.bounds.width - 2) / 3, height: (UIScreen.main.bounds.width - 2) / 3)
                                    .clipped()
                            }
                        }
                    }
                }
                .navigationTitle("Username")
            }
        }


struct profileeView_Previews: PreviewProvider {
    static var previews: some View {
        profileeView()
    }
}
