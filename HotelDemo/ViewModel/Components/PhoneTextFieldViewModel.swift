//
//  PhoneTextFieldViewModel.swift
//  HotelDemo
//
//  Created by Лаборатория on 09.09.2023.
//

import Foundation

final class PhoneTextFieldViewModel: ObservableObject {

    @Published var text: String = ""

    var placeholder: String = "(***) ***-**-**"
    
}
