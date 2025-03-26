//
//  InformationText.swift
//  Gomu
//
//  Created by Asad on 26/03/25.
//
import SwiftUI

public struct InformationText: View{
    var label: String
    var data: String
    var fontSize: CGFloat = 48
    public var body: some View {
        VStack{
            Text(label)
                .font(.system(.headline,design:.rounded))
            Text(data)
                .font(.system(size: fontSize, design: .rounded))
                .bold()
        }
        .foregroundColor(.white)
        .padding(20)
    }
}
