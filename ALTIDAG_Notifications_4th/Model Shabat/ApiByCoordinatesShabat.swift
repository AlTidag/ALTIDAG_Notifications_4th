//
//  ApiFromCoordinates.swift
//  ALTIDAG_Notifications_1st
//
//  Created by Itzhak Duani on 07/06/2022.
//


import Foundation

protocol TimeManagerDelegateLatLonShabat {
    func didUpdateTimeLatLonShabat(time: TimeModelShabat?)
    
}

struct TimeManagerLatLonShabat {

    let timeURLShabat = "https://www.hebcal.com/shabbat?cfg=json"
    
    var delegate: TimeManagerDelegateLatLonShabat?

    func fetchTimeLatLonShabat(latitude: Double, longitude: Double) {
        let urlString = "\(timeURLShabat)&latitude=\(latitude)&longitude=\(longitude)"
        print(urlString)
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        //1. Create a url
        
        if let url = URL(string: urlString) {
            //2. Create a URLSession
            
            let session = URLSession(configuration: .default)
            //3. Give the session a task
            
            let task = session.dataTask(with: url) { data, response, error in
//                if let data = data {
//                         if let jsonString = String(data: data, encoding: .utf8) {
//                            print(jsonString)
//                             print(url)
//                         }
//                       }
                if error != nil {
                    print(error.debugDescription)
                    return
                }
                
                if let safeData = data {
                    if let timeLatLon = parseJSON(timeData: safeData) {
                        DispatchQueue.main.async {
                        self.delegate?.didUpdateTimeLatLonShabat(time: timeLatLon)
                            print("🤡🤡🤡🤡 are", timeLatLon)
                        }
                    }
                }
            }
            //4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(timeData: Data) -> TimeModelShabat? {
        let decoder = JSONDecoder()
        do {
            var candleLightTime: String = ""
            var candleLightTitle: String = ""
            var porshen: String = ""
            var titleOfShabat: String = ""
            var havdalah: String = ""
            var havdalahDate: String = ""
            
            let decodedData = try decoder.decode(TimesDataShabat.self, from: timeData)
            for item in decodedData.items {
                if item.category == "candles" {
                     candleLightTime = item.date
                     candleLightTitle = item.title
                     porshen = item.memo ?? ""
                }
                if item.category == "havdalah" {
                     titleOfShabat = item.hebrew
                     havdalah = item.title
                     havdalahDate = item.date
                }
            }
            
            let timesByLatLonShabat = TimeModelShabat(candleLightTime: candleLightTime, candleLightTitle: candleLightTitle,  porshen: porshen, titleOfShabat: titleOfShabat, havdalah: havdalah, havdalahDate: havdalahDate )
            print("⭐️⭐️⭐️⭐️", timesByLatLonShabat)
            return timesByLatLonShabat

        } catch {
            print(error)
            return nil
        }
    }
}

