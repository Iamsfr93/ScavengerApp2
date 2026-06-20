//
//  HuntListView.swift
//  ScavengerHuntApp
//
//  Created by Syed Fahad Rasheed on 2026-06-04.
//

import SwiftUI

struct HuntListView: View {
    let coloumns : [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @EnvironmentObject var huntManager: HuntManager
    
    var body: some View {
        VStack {
            // Progress tracker header
            Text("Found \(huntManager.foundCount) / \(huntManager.items.count) Items")
                .font(.headline)
            
            ProgressView(
                value: Double(huntManager.foundCount),
                total:  Double(huntManager.items.count)
            )
            .padding(.horizontal)
            
            
            ScrollView{
                
                
                LazyVGrid(columns: coloumns, spacing: 15) {
                    ForEach(huntManager.items) { item in
                        
                        // Tap an item to see its  hunt details
                        NavigationLink(destination: HuntDetailView(item: item)){
                            VStack(alignment: .leading){
                                
                                
                                HStack{
                                    Text("the Store name:  \(item.businessName)")
                                        .font(.headline)
                                    
                                    Spacer()
                                    
                                    if item.isFound {
                                        
                                        Image(systemName: "checkmark.seal.fill")
                                        
                                            .foregroundStyle(.green)
                                        
                                    }
                                    
                                }
                                Text("You Get: \(item.hiddenItemName)")
                                
                                    .font(.subheadline.bold())
                                
                            }.padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(.gray.opacity(0.1))
                                )
                        }
                    }
                }
            }
            //// Navigate to rewards screen with     progress
            NavigationLink(
                destination: RewardView(
                    foundCount: huntManager.foundCount
                    
                    
                )
                
            ) {
                
                Text("View Rewards")
                
            }
        }.padding()
            .navigationTitle("Scavenger Hunt")
    }
}

#Preview {
    HuntListView()
        .environmentObject(HuntManager())
}
