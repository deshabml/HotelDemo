//
//  PhoneTextFieldViewModel.swift
//  HotelDemo
//
//  Created by Лаборатория on 09.09.2023.
//

import Foundation

final class PhoneTextFieldViewModel: ObservableObject {

    @Published var text: String = ""
    @Published var editingPhone = false {
        didSet {
            if !editingPhone {
                do {
                    try ValidationPhone.shared.checkPhone(phone: text)
                    isValidPhone = true
                } catch {
                    isValidPhone = false
                }
            }
        }
    }
    @Published var isValidPhone = true

    var placeholder: String = "(***) ***-**-**"

    func setupEditingPhone(_ editingPhone: Bool) {
        self.editingPhone = editingPhone
    }
    
}
