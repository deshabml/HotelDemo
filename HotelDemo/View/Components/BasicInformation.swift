//
//  BasicInformation.swift
//  HotelDemo
//
//  Created by Лаборатория on 08.09.2023.
//

import SwiftUI

struct BasicInformation: View {

    @StateObject var viewModel: BasicInformationViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            rating(rating: viewModel.rating, ratingName: viewModel.ratingName)
            Text(viewModel.hotelName)
                .font(Font.custom("SF Pro Display", size: 22)
                    .weight(.medium))
            Button {
            } label: {
                Text(viewModel.hotelAdress)
                    .font(Font.custom("SF Pro Display", size: 14)
                        .weight(.medium))
            }
        }
    }

}

struct BasicInformation_Previews: PreviewProvider {

    static var previews: some View {
        BasicInformation(viewModel: BasicInformationViewModel(rating: 5,
                                                              ratingName: "Отлично",
                                                              hotelName: "Лучший отлеь",
                                                              hotelAdress: "Рядышком"))
    }

}

extension BasicInformation {

    private func rating(rating: Int, ratingName: String) -> some View {
        HStack {
            HStack(spacing: 4) {
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                Text("\(rating)" + " " + ratingName)
            }
            .font(Font.custom("SF Pro Display", size: 16)
                .weight(.medium))
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .foregroundColor(Color("OrangeColor"))
            .background(Color("YellovLiteColor"))
            .cornerRadius(5)
            Spacer()
        }
    }
    
}
