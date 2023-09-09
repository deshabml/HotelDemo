//
//  Coordinator.swift
//  HotelDemo
//
//  Created by Лаборатория on 06.09.2023.
//

import SwiftUI

@MainActor
final class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var page: MyPage = .hotel
    var hotelName: String = ""

    func goHome() {
        path.removeLast(path.count)
    }

    func goToHotelRoom() {
        path.append(MyPage.hotelRoom)
    }

    func goToBookingView() {
        path.append(MyPage.booking)
    }

    func goToPaidView() {
        path.append(MyPage.paid)
    }

    @ViewBuilder
    func getPage(_ page: MyPage) -> some View {
        switch page {
            case .hotel:
                HotelView()
            case .hotelRoom:
                HotelRoomView()
            case .booking:
                BookingView()
            case .paid:
                PaidView()
        }
    }

}

extension Coordinator {

    func setupHotelName(hotelName: String) {
        self.hotelName = hotelName
    }
    
}
