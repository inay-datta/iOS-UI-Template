//
//  ContentView.swift
//  Sample Dashboard
//
//  Created by Phanishree Kommalapati on 16/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var activeButton: Int = 0
    
    @State private var data: String?
    
    
    @StateObject var viewModel = ViewModel()
    
    
    var greeting: String {
            let hour = Calendar.current.component(.hour, from: Date())
            if (6..<12).contains(hour) {
                return "Good morning !"
            } else if (12..<16).contains(hour) {
                return "Good afternoon !"
            } else {
                return "Good evening !"
            }
        }
    
    var body: some View {
         
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        HStack{
                            Text("Dashboard ").bold()
                            Spacer()
                            Image("settings-img")
                                .resizable()
                                .frame(width: 35, height: 35)
                        }.padding()
                            .background(Color.blue)
                        
                        
                        VStack(spacing:0){
                            
                            Text(greeting)
                                .font(.caption)
                                .opacity(0.5)
                                .alignmentGuide(.leading) { _ in -22}
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 20)
                            
                            Text("Vinay Datta 👋")
                                .font(.largeTitle)
                                .bold()
                                .alignmentGuide(.leading) { _ in -20}
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            
                            LineChart(data: viewModel.overallUrlChart)
                                .frame(width: 350, height: 200)
                                .padding(.top, 10)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .strokeBorder(Color.gray, lineWidth: 1)
                                )
                                .shadow(radius: 5)
                            
                            //                        // X-axis label
                            Text("Hour of the Day")
                                .font(.caption)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading,100)
                            //
                            //                        // Y-axis label
                            Text("Number of Clicks")
                                .font(.caption)
                                .rotationEffect(.degrees(-90))
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, -35)
                                .padding(.vertical, -150)
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 1) {
                                StatisticCard(icon: "clicks-img", value: String(viewModel.totalClicks), label: "Today's clicks")
                                StatisticCard(icon: "location-img", value: "Ahmedab..", label: "Top Location")
                                StatisticCard(icon: "source-img", value: "Instagra", label: "Top source")
                                StatisticCard(icon: "instagram", value: "Instagra", label: "Top source")
                                StatisticCard(icon: "instagram", value: "Instagra", label: "Top source")
                                StatisticCard(icon: "instagram", value: "Instagra", label: "Top source")
                            }
                        }
                        
                        Button(action: {
                        }) {
                            HStack{
                                Image("analytics-img")
                                    .frame(width: 15, height: 15)
                                
                                Text("View Analytics")
                                    .foregroundColor(.black)
                                    .fontWeight(.semibold)
                                    .padding(20)
                            }
                            .frame(width: 350, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .strokeBorder(Color.gray, lineWidth: 1)
                            )
                        }
                        
                        HStack{
                            
                            Button(action: {
                                activeButton = 0 // Set the first button as active
                            }) {
                                Text("Top links")
                                    .foregroundColor(activeButton == 0 ? .black : .gray) // Set text color based on active state
                                    .fontWeight(.semibold)
                                    .padding(10)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .strokeBorder(Color.gray, lineWidth: 1)
                                            .fill(activeButton == 0 ? Color(red: 14/255, green: 111/255, blue: 255/255) : Color.white) // Set background color based on active state
                                    )
                            }
                            .padding()
                            
                            Button(action: {
                                activeButton = 1 // Set the second button as active
                            }) {
                                Text("Recent links")
                                    .foregroundColor(activeButton == 1 ? .black : .gray) // Set text color based on active state
                                    .fontWeight(.semibold)
                                    .padding(10)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .strokeBorder(Color.gray, lineWidth: 1)
                                            .fill(activeButton == 1 ? Color(red: 14/255, green: 111/255, blue: 255/255) : Color.white) // Set background color based on active state
                                    )
                            }
                            .padding()
                            
                            Button(action: {
                                //TODO: Handle button action here
                            }) {
                                Image("search-img")
                                    .frame(width: 30, height: 30)
                                    .background(
                                        RoundedRectangle(cornerRadius: 5)
                                            .strokeBorder(Color.gray, lineWidth: 1)
                                    )
                                
                            }.padding()
                        }
                        
                        VStack(spacing: 10){
                            
                            ForEach(activeButton == 0 ? viewModel.topLinks : viewModel.recentLinks, id: \.self) { linkData in
                                //
                                LinkCard(linkIcon: "companyIcon-img", linkTitle: linkData.title,totalNumberOfClicksOfLink: String(linkData.total_clicks), createdAt: linkData.created_at, link: linkData.smart_link)
                            }
                            
                        }
                        
                        Spacer()
                        
                    }
                }.onAppear {
                    print("calling fetchData")
                    print("hi")
                    viewModel.fetchData()
                }
                
                HStack(spacing: 10){
                    NavigationBarItem(icon: "link-icon", title: "Links", isMiddleIcon: false)
                    NavigationBarItem(icon: "magazine-img", title: "Courses", isMiddleIcon: false)
                    Spacer()
                    NavigationBarItem(icon: "add-img", title: "", isMiddleIcon: true)
                    Spacer()
                    NavigationBarItem(icon: "speaker-img", title: "Campaigns", isMiddleIcon: false)
                    NavigationBarItem(icon: "profile-img", title: "Profile", isMiddleIcon: false)
                }
                .padding()
                .background(Color.white)
                .edgesIgnoringSafeArea(.bottom)
                .frame(maxWidth: geometry.size.width)
                .shadow(radius: 5)
                .frame(height: 20)
            }
        }
        
    }
}


#Preview {
    ContentView()
}
