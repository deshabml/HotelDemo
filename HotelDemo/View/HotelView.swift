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
        ScrollView(showsIndicators: false) {
            VStack (spacing: 8) {
                VStack {
                    VStack(spacing: 16) {
                        ImageCharacter(viewModel: viewModel.imagesCharacterVM)
                        basicInformation()
                    }
                    .padding()
                }
                .background(Color.white)
                .cornerRadius(12)
                VStack {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Об отеле")
                            .font(Font.custom("SF Pro Display", size: 22)
                                .weight(.medium))
                        VStack(alignment: .leading, spacing: 12) {
                            TagList(viewModel: viewModel.tagListVM)
                            Text(viewModel.hotel.aboutTheHotel.description)
                                .font(.custom("SF Pro Display",
                                              size: CGFloat(16)))
                        }
                        ditailedList()
                    }
                    .padding()
                }
                .background(Color.white)
                .cornerRadius(12)
                VStack {
                    ButtonGoTo(viewModel: ButtonGoToViewModel(title: "К выбору номера",
                                                              completion: {
                        coordinator.setupHotelName(hotelName: viewModel.hotel.name)
                        coordinator.goToHotelRoom()}))
                }
                .padding()
                .background(Color.white)
            }
            .background(Color("BackgraundGreyColor"))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
    
    private func basicInformation() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                rating(rating: viewModel.hotel.rating, ratingName: viewModel.hotel.ratingName)
                Text(viewModel.hotel.name)
                    .font(Font.custom("SF Pro Display", size: 22)
                        .weight(.medium))
                Button {
                } label: {
                    Text(viewModel.hotel.adress)
                        .font(Font.custom("SF Pro Display", size: 14)
                            .weight(.medium))
                }
            }
            HStack(alignment: .bottom, spacing: 8) {
                Text(viewModel.preisFormat())
                    .font(Font.custom("SF Pro Display", size: 30)
                        .weight(.semibold))
                Text(viewModel.hotel.priceForIt.lowercased())
                    .foregroundColor(.secondary)
                    .font(.custom("SF Pro Display", size: CGFloat(16)))
            }
        }
    }
    
    private func ditailedList() -> some View {
        VStack {
            List {
                Section {
                    ForEach(viewModel.detailedInfo, id: \.self) { detail in
                        HStack {
                            Image(detail.imegeName)
                                .frame(width: 24, height: 24)
                            VStack(alignment: .leading) {
                                Text(detail.name)
                                    .font(.custom("SF Pro Display",
                                                  size: CGFloat(16)))
                                Text("Самое необходимое")
                                    .font(.custom("SF Pro Display",
                                                  size: CGFloat(14)))
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .frame(maxWidth: .infinity)
                        .listRowBackground(Color.clear)
                    }
                }
                .listSectionSeparator(.hidden, edges: .bottom)
            }
            .listStyle(.plain)
            .frame(height: 176)
        }
        .background(Color("ListBackgraundColor"))
        .cornerRadius(12)
    }
    
}
