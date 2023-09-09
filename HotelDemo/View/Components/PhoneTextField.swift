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

        VStack(alignment: .leading, spacing: 0) {
            Text("Номер телефона")
            HStack(spacing: 4) {
                Text("+7")
                    .font(Font.custom("SF Pro Display", size: 16))
                    .foregroundColor(!viewModel.text.isEmpty ? Color.black : .secondary)
                TextField(viewModel.placeholder, text: $viewModel.text) { (editing) in
                    viewModel.setupEditingPhone(editing)
                }
                    .font(Font.custom("SF Pro Display", size: 16))
                    .onChange(of: viewModel.text, perform: { oldValue in
                        viewModel.text = format(with: "(XXX) XXX-XX-XX", phone: oldValue)
                    })
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal)
        .background(viewModel.isValidPhone ? Color("BackgraundGreyColor") : Color("ErrorValidColor"))
        .cornerRadius(10)
        .animation(.easeInOut, value: viewModel.isValidPhone)
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
