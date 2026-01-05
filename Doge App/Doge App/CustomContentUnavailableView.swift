//
//  CustomContentUnavailableView.swift
//  Doge App
//
//  Created by sonukg on 03/01/26.
//

import SwiftUI

struct CustomContentUnavailableView: View {
    var icon: String
    var title:String
    var description:String
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "pawprint.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.orange)
            
            Text("No Pets Available")
                .font(.title)
                .fontWeight(.bold)
            
            Text("You haven't added any pets yet. Tap the '+' button to add your furry friends!")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    CustomContentUnavailableView(
        icon: "pawprint.circle.fill",
        title: "No Pets Available",
        description: "You haven't added any pets yet. Tap the '+' button to add your furry friends!"
    )
}


