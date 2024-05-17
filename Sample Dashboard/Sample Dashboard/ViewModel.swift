//
//  ViewModel.swift
//  Sample Dashboard
//
//  Created by Phanishree Kommalapati on 17/05/24.
//

import Foundation

struct Response: Codable, Hashable {
    let status: Bool
    let statusCode: Int
    let message: String
    let support_whatsapp_number: String
    let extra_income: Double
    let total_links: Int
    let total_clicks: Int
    let today_clicks: Int
    let top_source: String
    let top_location: String
    let startTime: String
    let links_created_today: Int
    let applied_campaign: Int
    let data: DataModel
}

struct DataModel: Codable, Hashable {
    let recent_links: [Link]
    let top_links: [Link]
    let favourite_links: [Link]
    let overall_url_chart: [String: Int]
}

struct Link: Codable, Hashable {
    
    let url_id: Int
    let web_link: String
    let smart_link: String
    let title: String
    let total_clicks: Int
    let original_image: String
    let thumbnail: String?
    let times_ago: String
    let created_at: String
    let domain_id: String
    let url_prefix: String?
    let url_suffix: String
    let app: String
    let is_favourite: Bool
}

class ViewModel: ObservableObject {
    
    @Published var topLinks : [Link] = []
    
    @Published var recentLinks : [Link] = []
    
    @Published var overallUrlChart : [String: Int] = [:]
    
    @Published var totalClicks : Int = 0

    
    func fetchData() {
            guard let url = URL(string: "https://api.inopenapp.com/api/v1/dashboardNew") else {
                print("Invalid URL")
                return
            }
        
        print("making GET call")

            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI", forHTTPHeaderField: "Authorization")

            URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    print("Error: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }

                DispatchQueue.main.async {
                    print("Received data")
                    print(data)
                    
                    do {
                        
                        print("inside do")
                        
                        let response = try JSONDecoder().decode(Response.self, from: data)
                        
                        print(response.data.recent_links)
                        
                        print(response.today_clicks)
                        
                        self.topLinks = response.data.top_links
                        self.recentLinks = response.data.recent_links
                        self.totalClicks = response.today_clicks
                        self.overallUrlChart =  response.data.overall_url_chart
                        
                        
                        
                    }catch {
                        print("inside catch. some error")
                        print(error)
                    }
                }
            }.resume()
        }
    
}
