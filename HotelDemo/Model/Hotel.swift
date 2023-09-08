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
    var imageUrls: [String]
    var aboutTheHotel: AboutTheHotel

    struct AboutTheHotel: Decodable {

        let description: String
        let peculiarities: [String]

    }

    static var clearHotel: Hotel {
        Hotel(id: 0,
              name: "",
              adress: "",
              minimalPrice: 0,
              priceForIt: "",
              rating: 0,
              ratingName: "",
              imageUrls: [""],
              aboutTheHotel: Hotel.AboutTheHotel(description: "",
                                                 peculiarities: [""]))
    }

}
