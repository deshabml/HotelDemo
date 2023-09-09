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
    let phoneTFVM = PhoneTextFieldViewModel()
    let mailTFVM = BookingTextFieldViewModel(placeholder: "Почта")
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
    var toutistsCells = [TouristCellViewModel(index: 0)]
    @Published var isShowErrorAlert = false

    init() {
        getData()
        mailTFVM.isMail = true
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

    func checkTouristsInfo() -> Bool {
        let isMail = ValidationMail.shared.isMail(mail: mailTFVM.text)
        let isPhone = ValidationPhone.shared.isPhone(phone: phoneTFVM.text)
        if !isMail {
            mailTFVM.isValid = false
        } else {
            mailTFVM.isValid = true
        }
        if !isPhone {
            phoneTFVM.isValidPhone = false
        } else {
            phoneTFVM.isValidPhone = true
        }
        var itog = isMail && isPhone
        for tourist in toutistsCells {
            let isName = checkTouristCell(touristCell: tourist.nameTFVM)
            let isSurname = checkTouristCell(touristCell: tourist.surnameTFVM)
            let isDateOfBirth = checkTouristCell(touristCell: tourist.dateOfBirthTFVM)
            let isPassportNumber = checkTouristCell(touristCell: tourist.passportNumberTFVM)
            let isCitizenship = checkTouristCell(touristCell: tourist.citizenshipTFVM)
            let isValidityPeriodOfPassportp = checkTouristCell(touristCell: tourist.validityPeriodOfPassportTFVM)
            if isName { itog = false }
            if isSurname { itog = false }
            if isDateOfBirth { itog = false }
            if isCitizenship { itog = false }
            if isPassportNumber { itog = false }
            if isValidityPeriodOfPassportp { itog = false }
        }
        return itog
    }

    func deployAllTourists() {
        for tourist in toutistsCells {
            tourist.isShow = true
        }
    }

    func checkTouristCell(touristCell: BookingTextFieldViewModel) -> Bool {
        if touristCell.text.isEmpty {
            touristCell.isValid = false
            return false
        } else {
            touristCell.isValid = true
            return true
        }
    }

}
