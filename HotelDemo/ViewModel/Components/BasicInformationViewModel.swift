//
//  BasicInformationViewModel.swift
//  HotelDemo
//
//  Created by Лаборатория on 08.09.2023.
//

import Foundation

class BasicInformationViewModel: ObservableObject {

    let rating: Int
    let ratingName: String
    let hotelName: String
    let hotelAdress: String

    init(rating: Int, ratingName: String, hotelName: String, hotelAdress: String) {
        self.rating = rating
        self.ratingName = ratingName
        self.hotelName = hotelName
        self.hotelAdress = hotelAdress
    }
    
}
