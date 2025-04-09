//
//  SettingRow.swift
//  Gomu
//
//  Created by Franco Antonio Pranata on 08/04/25.
//

import SwiftUI

struct SettingRow: View {
    let icon: String
    let title: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.white)
                .frame(width: 30, height: 30)
                .background(Color("secondary"))
                .clipShape(Circle())

            Text(title)
                .foregroundColor(.white)
                .font(.system(.body, design: .rounded))
                .fontWeight(.medium)

            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
}
