//
//  BookingTextFieldViewModel.swift
//  HotelDemo
//
//  Created by Лаборатория on 09.09.2023.
//

import Foundation

final class BookingTextFieldViewModel: ObservableObject {

    @Published var text: String = "" {
        didSet {
            if !isMail {
                if text.isEmpty {
                    isValid = false
                } else {
                    isValid = true
                }
            }
        }
    }
    let placeholder: String
    @Published var isValid = true
    var isMail = false
    
    init(placeholder: String) {
        self.placeholder = placeholder
    }
    
}
