//
//  BookingViewModel.swift
//  HotelDemo
//
//  Created by Лаборатория on 08.09.2023.
//

import Foundation

final class BookingViewModel: ObservableObject {

    let name: String = "Бронирование"
    @Published var booking = Booking.clearBooking
    let phoneTextFieldVM = PhoneTextFieldViewModel()
    @Published var mail: String = ""
    let basicInfoVM = BasicInformationViewModel()
    @Published var editingMail = false {
        didSet {
            if !editingMail {
                do {
                    try ValidationMail.shared.checkMail(mail: mail)
                    isValidMail = true
                } catch {
                    isValidMail = false
                }
            }
        }
    }
    @Published var isValidMail = true
    @Published var tourists = [Tourist.clearTourist]
    let nameTourists = ["Первый", "Второй", "Третий", "Четвертый", "Пятый", "Шестой", "Седьмой", "Восьмой", "Девятый", "Десятый", "Одиннадцатый", "Двенадцатый", "Тринадцатый", "Четырнадцатый", "Пятнадцатый", "Шестнадцатый", "Семнадцатый", "Восемнадцатый", "Девятнадцатый", "Двадцатый"]

    init() {
        getData()
    }

    private func getData() {
        Task {
            do {
                let booking = try await NetworkServiceAA.shared.getData(dataset: Booking.clearBooking)
                DispatchQueue.main.async {
                    self.booking = booking
                    self.basicInfoVM.setup(rating: booking.horating,
                                           ratingName: booking.ratingName,
                                           hotelName: booking.hotelName,
                                           hotelAdress: booking.hotelAdress)
                }
            } catch {
                print(error)
            }
        }
    }

    func dates() -> String {
        booking.tourDateStart + " - " + booking.tourDateStop
    }

    func setupEditingMail(_ editingMail: Bool) {
        self.editingMail = editingMail
    }

}
