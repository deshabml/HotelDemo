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
                VStack(alignment: .leading, spacing: 20) {
                    Text("Информация о покупателе")
                        .font(Font.custom("SF Pro Display", size: 22)
                            .weight(.medium))
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Номер телефона")
                        HStack(spacing: 4) {
                            Text("+7")
                                .foregroundColor(!viewModel.phone.isEmpty ? Color.black : .secondary)
                            PhoneTextField(text: $viewModel.phone, placeholder: "(***) ***-**-**")
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color("BackgraundGreyColor"))
                    .cornerRadius(10)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                
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

}
