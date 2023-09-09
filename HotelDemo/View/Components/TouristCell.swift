//
//  TouristCell.swift
//  HotelDemo
//
//  Created by Лаборатория on 09.09.2023.
//

import SwiftUI

struct TouristCell: View {

    @StateObject var viewModel: TouristCellViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text(viewModel.nameTourists[viewModel.index] + " турист")
                Spacer()
                Button {
                    viewModel.isShow.toggle()
                } label: {
                    if viewModel.isShow {
                        Image(systemName: "chevron.up")
                            .foregroundColor(.blue)
                            .padding(.leading, 10)
                            .padding(.trailing, 8)
                            .padding(.vertical, 12)
                            .background(Color(red: 0.05, green: 0.45, blue: 1).opacity(0.1))
                            .cornerRadius(6)
                    } else {
                        Image(systemName: "chevron.down")
                            .foregroundColor(.blue)
                            .padding(.leading, 10)
                            .padding(.trailing, 8)
                            .padding(.vertical, 12)
                            .background(Color(red: 0.05, green: 0.45, blue: 1).opacity(0.1))
                            .cornerRadius(6)
                    }
                }
            }
            .font(Font.custom("SF Pro Display", size: 22)
                .weight(.medium))
            if viewModel.isShow {
                VStack(spacing: 8) {
                    BookingTextField(viewModel: BookingTextFieldViewModel(placeholder: "Имя"))
                    BookingTextField(viewModel: BookingTextFieldViewModel(placeholder: "Фамилия"))
                    BookingTextField(viewModel: BookingTextFieldViewModel(placeholder: "Дата рождения"))
                    BookingTextField(viewModel: BookingTextFieldViewModel(placeholder: "Гражданство"))
                    BookingTextField(viewModel: BookingTextFieldViewModel(placeholder: "Номер загранпаспорта"))
                    BookingTextField(viewModel: BookingTextFieldViewModel(placeholder: "Срок действия загранпаспорта"))
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .animation(.easeInOut, value: viewModel.isShow)
    }

}

struct TouristCell_Previews: PreviewProvider {

    static var previews: some View {
        TouristCell(viewModel: TouristCellViewModel(index: 0))
    }

}
