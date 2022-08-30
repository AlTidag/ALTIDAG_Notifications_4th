//
//  ApiByCoordinatesWeekdays.swift
//  ALTIDAG_Notifications_1st
//
//  Created by Itzhak Duani on 09/06/2022.
//


import Foundation

protocol TimeManagerDelegateLatLonWeekly {
    func didUpdateWeeklyTimeLatLonWeek(time: TimeModelWeekDays?)
    
}

struct TimeManagerLatLonWeekly {

    let timeURLWeekly = "https://www.hebcal.com/zmanim?cfg=json"
    
    var delegate: TimeManagerDelegateLatLonWeekly?

    func fetchTimeLatLonWeek(latitude: Double, longitude: Double) {
        let urlString = "\(timeURLWeekly)&latitude=\(latitude)&longitude=\(longitude)"
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
                        self.delegate?.didUpdateWeeklyTimeLatLonWeek(time: timeLatLon)
                            print("times latlon 🎃🎃🎃🎃weekly",timeLatLon)
                        }
                    }
                }
            }
            //4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(timeData: Data) -> TimeModelWeekDays? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(TimesDataWeekDays.self, from: timeData)
            let date = decodedData.date
            let dawn = decodedData.times.alotHaShachar
            let sunrise = decodedData.times.sunrise
            let chatzot = decodedData.times.chatzot
            let sunset = decodedData.times.sunset
            let candleLightTime = decodedData.times.candleLightTime
            let porshen = decodedData.times.porshen
            let titleOfShabat = decodedData.times.titleOfShabat
            let havdalah = decodedData.times.havdalah
//            let havdalahDate = decodedData.times.havdalahDate
            
            let timesByLatLon = TimeModelWeekDays( date: date, dawn: dawn, sunrise: sunrise, chatzot: chatzot, sunset: sunset, candleLightTime: candleLightTime, porshen: porshen, titleOfShabat: titleOfShabat, havdalah: havdalah)
//            print("🎃🎃🎃🎃 times are", timesByLatLon)
            
            return timesByLatLon

        } catch {
            print(error)
            return nil
        }
    }
}


