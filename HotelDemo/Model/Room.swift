//
//  Room.swift
//  HotelDemo
//
//  Created by Лаборатория on 08.09.2023.
//

import Foundation

struct Room: Identifiable, Decodable {

    let id: Int
    var name: String
    var price: Int
    var pricePer: String
    var peculiarities: [String]
    var imageUrls: [String]

    static var clearRoom: Room {
        Room(id: 0,
             name: "",
             price: 0,
             pricePer: "",
             peculiarities: [""],
             imageUrls: [""])
    }

}
