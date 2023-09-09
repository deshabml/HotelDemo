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
    @Published var mailTFVM = BookingTextFieldViewModel(placeholder: "Почта")
    let basicInfoVM = BasicInformationViewModel()
    @Published var editingMail = false {
        didSet {
            if !editingMail {
                do {
                    try ValidationMail.shared.checkMail(mail: mailTFVM.text)
                    mailTFVM.isValid = true
                } catch {
                    mailTFVM.isValid = false
                }
            }
        }
    }
    @Published var tourists = [Tourist.clearTourist]
    let buttonGoToVM = ButtonGoToViewModel(title: "Оплатить ")

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
                    self.buttonGoToVM.title = "Оплатить " + self.itogPrice()
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

    func priceFormat(price: Int) -> String {
        let priseStringArray = Array(String(price)).map { String($0) }
        var priseString = ""
        for index in 0 ..< priseStringArray.count {
            priseString += priseStringArray[index]
            if (priseStringArray.count - 1 - index) % 3 == 0 {
                priseString += " "
            }
        }
        let itog = priseString  + " ₽"
        return itog
    }

    func itogPrice() -> String {
        let itog = booking.tourPrice + booking.fuelCharge + booking.serviceCharge
        return(priceFormat(price: itog))
    }

}
