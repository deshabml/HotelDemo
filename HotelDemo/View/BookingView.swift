//
//  BookingView.swift
//  HotelDemo
//
//  Created by Лаборатория on 06.09.2023.
//

import SwiftUI

struct BookingView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var coordinator: Coordinator
    @StateObject var viewModel = BookingViewModel()

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 8) {
                VStack {
                    BasicInformation(viewModel: viewModel.basicInfoVM)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                bookingData()
                userInfo()
                touristsInfo()
            }
            .padding(.vertical, 8)
            .background(Color("BackgraundGreyColor"))
        }
        .modifier(BackgroundElement(name: viewModel.name, completion: {
            self.presentationMode.wrappedValue.dismiss()
        }))
    }
    
}

struct BookingView_Previews: PreviewProvider {

    static var previews: some View {
        NavigationStack {
            BookingView()
                .environmentObject(Coordinator())
        }
    }

}

extension BookingView {

    private func bookingDataCell(title: String, value: String) -> some View {
        HStack() {
            HStack() {
                Text(title)
                    .font(Font.custom("SF Pro Display", size: 16))
                    .foregroundColor(.secondary)
                Spacer()
            }
            .frame(width: 140)
            Text(value)
            Spacer()
        }
    }

    private func bookingData() -> some View {
        VStack(spacing: 16) {
            bookingDataCell(title: "Вылет из",
                            value: viewModel.booking.departure)
            bookingDataCell(title: "Страна, город",
                            value: viewModel.booking.arrivalCountry)
            bookingDataCell(title: "Даты",
                            value: viewModel.dates())
            bookingDataCell(title: "Кол-во ночей",
                            value: "\(viewModel.booking.numberOfNights)")
            bookingDataCell(title: "Отель",
                            value: viewModel.booking.hotelName)
            bookingDataCell(title: "Номер",
                            value: viewModel.booking.room)
            bookingDataCell(title: "Питание",
                            value: viewModel.booking.nutrition)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }

    private func phoneTextField() -> some View {
        VStack(spacing: 8) {
            PhoneTextField(viewModel: viewModel.phoneTextFieldVM)
        }
    }

    private func mailTextField() -> some View {
        BookingTextField(viewModel: viewModel.mailTFVM) { (editing) in
            viewModel.setupEditingMail(editing)
        }
    }

    private func userInfo() -> some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Информация о покупателе")
                .font(Font.custom("SF Pro Display", size: 22)
                    .weight(.medium))
            VStack(spacing: 8) {
                phoneTextField()
                mailTextField()
                Text("Эти данные никому не передаются. После оплаты мы вышлим чек на указанный вами номер и почту")
                    .font(Font.custom("SF Pro Display", size: 14))
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }

    private func touristsInfo() -> some View {
        VStack {
            ForEach(0 ..< viewModel.tourists.count, id: \.self) { index in
                TouristCell(viewModel: TouristCellViewModel(index: index))
            }
            if viewModel.tourists.count < 20 {
                VStack {
                    HStack {
                        Text("Добавить туриста")
                        Spacer()
                        Button {
                            viewModel.tourists.append(Tourist.clearTourist)
                        } label: {
                            Image(systemName: "plus")
                                .padding(.horizontal, 10)
                                .padding(.vertical, 12)
                                .foregroundColor(Color.white)
                                .background(Color.blue)
                                .cornerRadius(6)
                        }
                    }
                    .font(Font.custom("SF Pro Display", size: 22)
                        .weight(.medium))
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
            }
        }
    }

}
