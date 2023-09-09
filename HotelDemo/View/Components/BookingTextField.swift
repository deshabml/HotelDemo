//
//  BookingTextField.swift
//  HotelDemo
//
//  Created by Лаборатория on 09.09.2023.
//

import SwiftUI

struct BookingTextField: View {

    @StateObject var viewModel: BookingTextFieldViewModel
    var completion: (()->())?

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if !viewModel.text.isEmpty {
                Text(viewModel.placeholder)
                    .font(Font.custom("SF Pro Display", size: 12))
                    .foregroundColor(.secondary)
            }
            HStack(spacing: 4) {
                TextField(viewModel.placeholder, text: $viewModel.text) { (editing) in
                    completion?()
                }
                    .font(Font.custom("SF Pro Display", size: 16))
            }
        }
        .padding(.horizontal)
        .frame(height: 52)
        .background(viewModel.isValid ? Color("BackgraundGreyColor") : Color("ErrorValidColor"))
        .cornerRadius(10)
        .animation(.easeInOut, value: viewModel.isValid)
    }

}

struct BookingTextField_Previews: PreviewProvider {

    static var previews: some View {
        BookingTextField(viewModel: BookingTextFieldViewModel(placeholder: "Name"))
    }

}
