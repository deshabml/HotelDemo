//
//  BasicInformationViewModel.swift
//  HotelDemo
//
//  Created by Лаборатория on 08.09.2023.
//

import Foundation

class BasicInformationViewModel: ObservableObject {

    @Published var rating: Int = 0
    @Published var ratingName: String = ""
    @Published var hotelName: String = ""
    @Published var hotelAdress: String = ""

    init() { }

    init(rating: Int, ratingName: String, hotelName: String, hotelAdress: String) {
        self.rating = rating
        self.ratingName = ratingName
        self.hotelName = hotelName
        self.hotelAdress = hotelAdress
    }

    func setup(rating: Int, ratingName: String, hotelName: String, hotelAdress: String) {
        self.rating = rating
        self.ratingName = ratingName
        self.hotelName = hotelName
        self.hotelAdress = hotelAdress
    }
    
}
