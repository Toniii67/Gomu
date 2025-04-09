//
//  SettingsView.swift
//  Gomu
//
//  Created by Franco Antonio Pranata on 25/03/25.
//

import SwiftUI

public struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
//    @EnvironmentObject var signInManager: AppleSignInManager

    public var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Settings")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.trailing, 96)
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark.circle")
                        .font(.title)
                        .foregroundColor(Color("white"))
                }
            }
            .padding(.trailing)
            
            VStack(spacing: 20) {
                SettingRow(icon: "bell.fill", title: "Notification")
                SettingRow(icon: "paintpalette.fill", title: "Appearance")
                SettingRow(icon: "lock.fill", title: "Privacy")
                SettingRow(icon: "info.circle.fill", title: "About")
                
                // Log Out button with action
//                Button(action: {
//                    signInManager.logout()
//                }) {
//                    SettingRow(icon: "arrow.right.square.fill", title: "Log Out")
//                }
            }
            .padding(.horizontal)
            .padding(.top, 25)

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("primary"))
        .edgesIgnoringSafeArea(.bottom)
    }
}


#Preview {
    SettingsView()
}

