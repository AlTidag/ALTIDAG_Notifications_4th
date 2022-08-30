//
//  ViewController.swift
//  ALTIDAG_Notifications_1st
//
//  Created by Itzhak Duani on 06/06/2022.
//

import UIKit
import MapKit
import CoreLocation
import CoreLocationUI

class LocationSearchVC: UIViewController, UISearchBarDelegate, MKLocalSearchCompleterDelegate, TimeManagerDelegateLatLonShabat, TimeManagerDelegateLatLonWeekly, CLLocationManagerDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchResultsTable: UITableView!
    @IBOutlet weak var howManydaysSlider: UISlider!
    
    var searchCompleter = MKLocalSearchCompleter()
    var searchResults = [MKLocalSearchCompletion]()
    let locationManager = CLLocationManager()
    var shabatTimeManagerLatLon = TimeManagerLatLonShabat()
    // Attempt to connect to weekly API at the same launch
    var weeklyTimeManagerLatLon = TimeManagerLatLonWeekly()
    //    var locationTimeOfDaymanager = ApiLocationTimeOfDay()
    var shabatModel: TimeModelShabat?
    var weeklyModel: TimeModelWeekDays?
    //    var locationTimeOfDayModel: LocationTimeOfDayModel?
    
    var timeBeforePrayer = ShabatTableVC().shabatPrayerTimes
    var lat: Double = 0
    var lon: Double = 0
    var newOffsetTimeZone: Int?
    var checkIfSchedule: Float = 0
    //    let offsetTime: Int?
    
    var searchedLocationCurrentTime = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        func locationsManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
            print("locations = \(locValue.latitude) \(locValue.longitude)")
        }
        
        UNUserNotificationCenter.current().requestAuthorization(options: .alert) { _, _ in
        }
        
        searchCompleter.delegate = self
        searchBar?.delegate = self
        searchResultsTable?.delegate = self
        searchResultsTable?.dataSource = self
        shabatTimeManagerLatLon.delegate = self
        weeklyTimeManagerLatLon.delegate = self
        //        locationTimeOfDaymanager.delegate = self
        print(timeBeforePrayer.forEach { print("Name: \($0.name), time: \($0.time)") })
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchCompleter.queryFragment = searchText
    }
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        searchResults = completer.results
        searchResultsTable.reloadData()
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
    }
    
    func didUpdateWeeklyTimeLatLonWeek(time: TimeModelWeekDays?) {
        weeklyModel = time
        moveToNextScreenIfPossible()
    }
    
    func didUpdateTimeLatLonShabat(time: TimeModelShabat?) {
        shabatModel = time
        moveToNextScreenIfPossible()
    }
    
    func getOffsetTimezone(latitude: Double, longitude: Double) {
        let loc = CLLocation.init(latitude: latitude, longitude: longitude)
        let coder = CLGeocoder()
        coder.reverseGeocodeLocation(loc) { (placemarks, error) in
            let place = placemarks?.last
            self.newOffsetTimeZone = place?.timeZone?.secondsFromGMT()
            self.moveToNextScreenIfPossible()
            print("❇️❇️❇️🍺🍺", self.newOffsetTimeZone)
        }
    }
    
    func moveToNextScreenIfPossible() {
        if let weeklyModel = weeklyModel {
            if let shabatModel = shabatModel {
                if let newOffsetTimeZone = newOffsetTimeZone {
                    if let SchedualeUserTimeVC = storyboard?.instantiateViewController(withIdentifier: "SchedualeUserTimeTableVC") as? SchedualeUserTimeTableVC {
                        self.navigationController?.pushViewController(SchedualeUserTimeVC, animated: true)
                        SchedualeUserTimeVC.shabatModels = shabatModel
                        SchedualeUserTimeVC.weeklyModels = weeklyModel
                        SchedualeUserTimeVC.newOffsetTimeZones = newOffsetTimeZone
                    }
                }
            }
        }
    }
}
extension LocationSearchVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let searchResult = searchResults[indexPath.row]
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        cell.textLabel?.text = searchResult.title
        cell.detailTextLabel?.text = searchResult.subtitle
        return cell
    }
}

extension LocationSearchVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
            
        let result = searchResults[indexPath.row]
        let searchRequest = MKLocalSearch.Request(completion: result)
        
        let search = MKLocalSearch(request: searchRequest)
        search.start { [self] (response, error) in
            guard let coordinate = response?.mapItems[0].placemark.coordinate else {
                return
            }
            
            guard let name = response?.mapItems[0].name else {
                return
            }
            
            print(name)
            
            lat = coordinate.latitude
            lon = coordinate.longitude
            
            self.weeklyTimeManagerLatLon.fetchTimeLatLonWeek(latitude: lat, longitude: lon)
            self.shabatTimeManagerLatLon.fetchTimeLatLonShabat(latitude: lat, longitude: lon)
            
            getOffsetTimezone(latitude: lat, longitude: lon)
            
            searchBar.text = ""
            searchResults.removeAll()
            tableView.reloadData()
            
           }
        }
//        }
    }






