//
//  HotelView.swift
//  HotelDemo
//
//  Created by Лаборатория on 06.09.2023.
//

import SwiftUI

struct HotelView: View {

    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var viewModel = HotelViewModel()

    var body: some View {
        ScrollView {
            VStack (spacing: 16) {
                VStack {
                    VStack {
                        imageCharacter()
                        if let hotel = viewModel.hotel {
                            VStack(alignment: .leading, spacing: 12) {
                                rating(rating: hotel.rating, ratingName: hotel.ratingName)
                                Text(hotel.name)
                                    .font(.custom("SF-Pro-Display-Regular", size: CGFloat(22)))
                                Button {
                                } label: {
                                    Text(hotel.adress)
                                        .font(.custom("SF-Pro-Display-Regular", size: CGFloat(14)))
                                }
                                HStack(alignment: .bottom) {
                                    Text(viewModel.preisFormat(prise: hotel.minimalPrice))
                                        .font(.custom("SF-Pro-Display-Regular", size: CGFloat(30)))
                                    Text(hotel.priceForIt.lowercased())
                                        .foregroundColor(.secondary)
                                        .font(.custom("SF-Pro-Display-Regular", size: CGFloat(16)))
                                }
                            }
                        }
                    }
                    .padding()
                }
                .background(Color.white)
                .cornerRadius(12)
                VStack {
                    Text("Наш отель мы так всем рады)")
                    Button {
                        coordinator.goToHotelRoom()
                    } label: {
                        Text("Hotel Room")
                    }
                    Spacer()
                }
                .background(Color.white)
                .cornerRadius(12)
            }
            .background(Color("BackgraundGreyColor"))
        }
        .background(Color.white)
        .navigationTitle("Отель")
        .navigationBarTitleDisplayMode(.inline)
    }

}

struct HotelView_Previews: PreviewProvider {

    static var previews: some View {
        NavigationStack {
            HotelView()
                .environmentObject(Coordinator())
        }
    }

}

extension HotelView {

    private func imageCharacter() -> some View {
        VStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 343, height: 257)
                    .cornerRadius(16)
            } else {
                ActivityIndicator()
                    .frame(width: 100, height: 257)
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }

    private func rating(rating: Int, ratingName: String) -> some View {
        HStack(spacing: 4) {
            Image(systemName: "star.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 15, height: 15)
            Text("\(rating)" + " " + ratingName)
        }
        .font(.custom("SF-Pro-Display-Regular", size: CGFloat(16)))
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .foregroundColor(Color("OrangeColor"))
        .background(Color("YellovLiteColor"))
        .cornerRadius(5)
    }
    
}
