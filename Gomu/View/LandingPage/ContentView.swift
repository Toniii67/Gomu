//
//  ContentView.swift
//  FavoriteItem
//
//  Created by William Chrisandy on 25/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.gomuBlue
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Gomu")
                    .font(.system(size: 60, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom,350 )
                
//                Spacer()
            }
            Image("GOMU_5X")
                .resizable()
                .frame(width:427.61, height:444 )
                .padding(.top, 350)
            Text("your walk buddy")
                .font(.system(.title2, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom,260 )
                
            
            
                     
            
        }
        
        
    }
}


#Preview {
    ContentView()
}
