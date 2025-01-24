//
//  File.swift
//  Citiconnect
//
//  Created by Apple on 24/01/25.
//

import Foundation

import Foundation

struct City: Identifiable, Codable ,Equatable{
    let id = UUID()
    let city: String
    let lat: String
    let lng: String
    let country: String
    let iso2: String
    let admin_name: String
    let capital: String
    let population: String
    let population_proper: String
    
    enum CodingKeys: String, CodingKey {
        case city
        case lat
        case lng
        case country
        case iso2
        case admin_name
        case capital
        case population
        case population_proper
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        city = try container.decode(String.self, forKey: .city)
        lat = try container.decode(String.self, forKey: .lat)
        lng = try container.decode(String.self, forKey: .lng)
        country = try container.decode(String.self, forKey: .country)
        iso2 = try container.decode(String.self, forKey: .iso2)
        admin_name = try container.decode(String.self, forKey: .admin_name)
        capital = try container.decode(String.self, forKey: .capital)
        population = try container.decode(String.self, forKey: .population)
        population_proper = try container.decode(String.self, forKey: .population_proper)
    }
}

