//
//  Hotel.swift
//  HotelDemo
//
//  Created by Лаборатория on 07.09.2023.
//

import Foundation

struct Hotel: Identifiable, Decodable {

    let id: Int
    var name: String
    var adress: String
    var minimalPrice: Int
    var priceForIt: String
    var rating: Int
    var ratingName: String
    var image_urls: [String]
    var aboutTheHotel: AboutTheHotel

    struct AboutTheHotel: Decodable {

        let description: String
        let peculiarities: [String]

    }

}
