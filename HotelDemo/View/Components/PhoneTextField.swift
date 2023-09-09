//
//  PhoneTextField.swift
//  HotelDemo
//
//  Created by Лаборатория on 08.09.2023.
//

import SwiftUI

struct PhoneTextField: View {

    @StateObject var viewModel: PhoneTextFieldViewModel

    var body: some View {
        TextField(viewModel.placeholder, text: $viewModel.text)
            .font(Font.custom("SF Pro Display", size: 16))
            .onChange(of: viewModel.text, perform: { oldValue in
                viewModel.text = format(with: "(XXX) XXX-XX-XX", phone: oldValue)
            })
    }

}

struct PhoneTextField_Previews: PreviewProvider {

    static var previews: some View {
        VStack {
            PhoneTextField(viewModel: PhoneTextFieldViewModel())
        }
        .background(Color.yellow)
    }

}

extension PhoneTextField {

    func format(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                result.append(numbers[index])
                index = numbers.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }

}
