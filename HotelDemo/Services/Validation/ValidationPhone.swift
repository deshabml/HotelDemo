//
//  ValidationPhone.swift
//  HotelDemo
//
//  Created by Лаборатория on 09.09.2023.
//

import Foundation

final class ValidationPhone {

    static let shared = ValidationPhone()

    private init() { }

    func checkPhone(phone: String) throws {
        guard phone != "" else { throw ValidationError.emptyPhone}
        guard isPhone(phone: phone) else { throw ValidationError.notPhone }
    }

    func isPhone(phone: String) -> Bool {
        let phonePattern = #"^\(?\d{3}\)?[ -]?\d{3}[ -]?\d{2}[ -]?\d{2}$"#
        var result = phone.range(
            of: phonePattern,
            options: .regularExpression
        )
        return (result != nil)
    }

}
