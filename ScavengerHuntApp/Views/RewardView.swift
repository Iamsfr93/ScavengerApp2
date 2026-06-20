//
//  RewardView.swift
//  ScavengerHuntApp
//
//  Created by Syed Fahad Rasheed on 2026-06-04.
//

import SwiftUI

struct RewardView: View {
    // Total items discovered during the hunt
    let foundCount: Int
    
    var body: some View {
        VStack{
            
            Text("🏆 Hunt Results")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Found Items: \(foundCount) / 10")
                .font(.title)
                .padding(.bottom)
            
            // Reward Tiers
            if foundCount >= 10 {

                VStack {

                    Text("🎁 20% Discount Code")
                        .font(.title2)

                    Text("🎉 Grand Prize Entry ($5000 Draw)")
                        .font(.title2)

                }
            } else if foundCount >= 7 {
                Text("20% Discount Code")
                    .font(.title2)
            } else if foundCount >= 5 {
                Text("🎁 10% Discount Code")
                    .font(.title2)
            } else {
                Text("Keep Hunting!")
                    .font(.title2)

            }
        }
        .padding()
    }
}

#Preview {
    RewardView(foundCount: 5)
}
