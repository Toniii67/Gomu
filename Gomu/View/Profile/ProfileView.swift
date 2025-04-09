//
//  ProfileView.swift
//  Gomu
//
//  Created by Franco Antonio Pranata on 25/03/25.
//

import SwiftUI

public struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    
    public var body: some View {
        VStack {
            // Custom Navbar
            HStack {
                Spacer()
                Text("Profile")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color("white"))
                    .padding(.leading, 50)
                
                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark.circle")
                        .font(.title)
                        .foregroundColor(.white)
                }
                
            }
            .padding(.trailing)
            
            ZStack{
                Image("Awan")
                VStack{
                    Image("Profile")
        //                .resizable()
        //                .frame(width: 85, height: 85)
                        .padding(.top, 30)
                    
                    Text("Franco Pranata")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color("white"))
                        .padding(.top, 10)
                    Text("Joined March 2025")
                        .font(.title3)
                        .fontWeight(.regular)
                        .foregroundColor(Color("white"))
                }
                
            }
            
            Spacer()
            
            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color("white2"))
                    .frame(height: 375)
                
                VStack{
                    Text("Achievements")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color("primary"))
                        .padding(.bottom, 50)
                    
                    HStack(spacing: 10){
                        VStack{
                            Image("StepStarter")
                                .resizable()
                                .frame(width: 110, height: 110)
                            Text("Step Starter")
                                .font(.callout)
                                .bold()
                                .foregroundStyle(Color("primary"))
                                .padding(.top, 5)
                            Text("Completed")
                                .font(.footnote)
                                .foregroundStyle(Color("primary"))
                        }
                        
                        VStack{
                            Image("PerfectWeek")
                                .resizable()
                                .frame(width: 110, height: 110)
                            Text("Step Starter")
                                .font(.callout)
                                .bold()
                                .foregroundStyle(Color("primary"))
                                .padding(.top, 5)
                            Text("1 of 10")
                                .font(.footnote)
                                .foregroundStyle(Color("primary"))
                        }
                        
                        VStack{
                            Image("KilometerCrusher")
                                .resizable()
                                .frame(width: 110, height: 110)
                            Text("Step Starter")
                                .font(.callout)
                                .bold()
                                .foregroundStyle(Color("primary"))
                                .padding(.top, 5)
                            Text("1 of 8")
                                .font(.footnote)
                                .foregroundStyle(Color("primary"))
                        }
                        
                    }
                    .padding(.bottom, 40)
                    
                    Text("See all achievements")
                        .foregroundStyle(Color("primary"))
                }
                
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("primary"))
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    ProfileView()
}
