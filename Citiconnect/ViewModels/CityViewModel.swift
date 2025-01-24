//
//  CityViewModel.swift
//  Citiconnect
//
//  Created by Apple on 24/01/25.
//


import Foundation
import Combine

class CitiesViewModel: ObservableObject {
    
    @Published var citiesByState: [String: [City]] = [:]
    @Published var isDataLoaded = false
    
    private var cancellables = Set<AnyCancellable>()
    
    // Function to fetch cities from file
    func fetchCitiesData() {
        // Load data from file
        guard let url = Bundle.main.url(forResource: "au_cities", withExtension: "json") else {
            print("Could not find the cities JSON file")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let citiesData = try JSONDecoder().decode([City].self, from: data)
            
            // Group cities by admin_name (STATE)
            let groupedCities = Dictionary(grouping: citiesData) { $0.admin_name }
            self.citiesByState = groupedCities
            self.isDataLoaded = true
        } catch {
            print("Error loading or parsing data: \(error)")
        }
    }
    
    // Function to reverse the order of cities
    func reverseCitiesOrder() {
        self.citiesByState = self.citiesByState.mapValues { $0.reversed() }
    }
    
    // Function to refresh data
    func refreshData() {
        fetchCitiesData()
    }
}
