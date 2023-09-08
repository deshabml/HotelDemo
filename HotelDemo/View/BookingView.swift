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
                VStack(spacing: 16) {
                    bookingDataCell(title: "Вылет из",
                                    value: viewModel.booking.departure)
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
}
