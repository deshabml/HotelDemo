//
//  BookingTextFieldViewModel.swift
//  HotelDemo
//
//  Created by Лаборатория on 09.09.2023.
//

import Foundation

final class BookingTextFieldViewModel: ObservableObject {

    @Published var text: String = ""
    let placeholder: String
    var isValid = true
    
    init(placeholder: String) {
        self.placeholder = placeholder
    }
    
}
