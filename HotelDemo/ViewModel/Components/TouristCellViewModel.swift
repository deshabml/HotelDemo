//
//  TouristCellViewModel.swift
//  HotelDemo
//
//  Created by Лаборатория on 09.09.2023.
//

import Foundation

final class TouristCellViewModel: ObservableObject {

    @Published var isShow = true
    let index: Int
    let nameTourists = ["Первый", "Второй", "Третий", "Четвертый", "Пятый", "Шестой", "Седьмой", "Восьмой", "Девятый", "Десятый", "Одиннадцатый", "Двенадцатый", "Тринадцатый", "Четырнадцатый", "Пятнадцатый", "Шестнадцатый", "Семнадцатый", "Восемнадцатый", "Девятнадцатый", "Двадцатый"]
    let nameTFVM = BookingTextFieldViewModel(placeholder: "Имя")
    let surnameTFVM = BookingTextFieldViewModel(placeholder: "Фамилия")
    let dateOfBirthTFVM = BookingTextFieldViewModel(placeholder: "Дата рождения")
    let citizenshipTFVM = BookingTextFieldViewModel(placeholder: "Гражданство")
    let passportNumberTFVM = BookingTextFieldViewModel(placeholder: "Номер загранпаспорта")
    let validityPeriodOfPassportTFVM = BookingTextFieldViewModel(placeholder: "Срок действия загранпаспорта")

    init(index: Int) {
        self.index = index
        if index > 0 {
            isShow = false
        }
    }

}
