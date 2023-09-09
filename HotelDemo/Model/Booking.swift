//
//  Booking.swift
//  HotelDemo
//
//  Created by Лаборатория on 08.09.2023.
//

import Foundation

struct Booking: Identifiable, Decodable {

    let id: Int
    var hotelName: String
    var hotelAdress: String
    var horating: Int
    var ratingName: String
    var departure: String
    var arrivalCountry: String
    var tourDateStart: String
    var tourDateStop: String
    var numberOfNights: Int
    var room: String
    var nutrition: String
    var tourPrice: Int
    var fuelCharge: Int
    var serviceCharge: Int

    static var clearBooking: Booking {
        Booking(id: 0,
                hotelName: "",
                hotelAdress: "",
                horating: 0,
                ratingName: "",
                departure: "",
                arrivalCountry: "",
                tourDateStart: "",
                tourDateStop: "",
                numberOfNights: 0,
                room: "",
                nutrition: "",
                tourPrice: 0,
                fuelCharge: 0,
                serviceCharge: 0)
    }

}
