//
//  LinkCard.swift
//  Sample Dashboard
//
//  Created by Phanishree Kommalapati on 17/05/24.
//

import Foundation
import SwiftUI

struct LinkCard: View {
    
    let linkIcon: String
    let linkTitle: String
    let totalNumberOfClicksOfLink: String
    let createdAt: String
    let link: URL
    
    init(linkIcon: String, linkTitle: String, totalNumberOfClicksOfLink: String, createdAt: String, link: String) {
            self.linkIcon = linkIcon
            self.linkTitle = linkTitle
            self.totalNumberOfClicksOfLink = totalNumberOfClicksOfLink
            self.createdAt = createdAt
            self.link = URL(string: link)!
        }
    
    var body: some View {
        VStack{
            
            HStack{
                
                Image(linkIcon)
                    .resizable()
                    .frame(width: 50, height: 50)
                
                VStack{
                    Text(linkTitle)
                        .font(.caption)
                        .foregroundStyle(Color.black)
                        .frame(width: 200, height: 10)
                    
                    Text(createdAt)
                        .foregroundStyle(Color.gray)
                        .frame(width: 100, height: 10)
                        .font(.caption2)
                    
                }
                
                VStack{
                    Text(totalNumberOfClicksOfLink)
                        .font(.title2)
                        .frame(width:100,height:10)
                        .foregroundColor(Color.black)
                    
                    Text("Clicks")
                        .font(.caption2)
                        .frame(width:50,height:15)
                        .foregroundColor(Color.gray)
                    
                }
                
                
            }
            
            
            HStack{
                
                Text(link.absoluteString)
                        .foregroundColor(.blue)
                        .frame(width: 200, height: 10)
                        .padding(.leading)
                        .onTapGesture {
                            
                            guard let url = URL(string: link.absoluteString) else { return }
                            UIApplication.shared.open(url)
                        }
                
                Spacer()
                
                Image("copy-img")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing)
                
                
                
            }
            .frame(width: 375,height: 50)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10)

                    .stroke(Color.blue, lineWidth: 1)
                    
            )
            
        }
        .padding()
        .frame(width: 375, height: 110)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.gray, lineWidth: 1)
        )
        
        
       
        
    }
}
