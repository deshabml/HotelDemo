//
//  MyPage.swift
//  HotelDemo
//
//  Created by Лаборатория on 06.09.2023.
//

//import Foundation

enum MyPage: String, CaseIterable, Identifiable {

    case hotel, hotelRoom, booking, paid

    var id: String {self.rawValue}

}
