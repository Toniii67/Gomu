//
//  SettingsView.swift
//  Gomu
//
//  Created by Franco Antonio Pranata on 25/03/25.
//

import SwiftUI

public struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode

    public var body: some View {
        VStack {
            // Custom Navbar
            HStack {
                Spacer()
                Text("Settings")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                        .foregroundColor(.gray)
                }
            }
            .padding()

            Spacer()
            Text("Pengaturan Konten")
                .font(.headline)
                .foregroundColor(.gray)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
//        .ignoresSafeArea(.all)
    }
}

#Preview {
    SettingsView()
}

