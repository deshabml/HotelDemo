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

    func goHome() {
        path.removeLast(path.count)
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
