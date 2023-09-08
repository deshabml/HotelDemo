//
//  BookingViewModel.swift
//  HotelDemo
//
//  Created by Лаборатория on 08.09.2023.
//

import Foundation

class BookingViewModel: ObservableObject {

    let name: String = "Бронирование"
    @Published var booking = Booking.clearBooking

    init() {
        getData()
    }

    private func getData() {
        Task {
            do {
                let booking = try await NetworkServiceAA.shared.getData(dataset: Booking.clearBooking)
                DispatchQueue.main.async {
                    self.booking = booking
                }
            } catch {
                print(error)
            }
        }
    }
    
}
