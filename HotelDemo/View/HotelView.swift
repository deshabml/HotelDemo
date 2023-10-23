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
                        VStack(alignment: .leading, spacing: 16) {
                            BasicInformation(viewModel: viewModel.basicInfoVM)
                            Price(viewModel: viewModel.priceVM)
                        }
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
                    ButtonGoTo(viewModel: ButtonGoToViewModel(title: "К выбору номера")) {
                        coordinator.setupHotelName(hotelName: viewModel.hotel.name)
                        coordinator.goToHotelRoom()
                    }
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

    private func ditailedList() -> some View {
        VStack {
            VStack(alignment: .trailing, spacing: 10) {
                ForEach(viewModel.detailedInfo, id: \.self) { detail in
                    HStack(alignment: .center, spacing: 12) {
                        Image(detail.imegeName)
                            .frame(width: 24, height: 24)
                        VStack(spacing: 10) {
                            HStack {
                                VStack(alignment: .leading, spacing: 2) {
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
                            if detail != viewModel.detailedInfo.last {
                                Divider()
                            }
                        }

                    }
                    .listRowBackground(Color.clear)
                }
            }
            .padding(15)
        }
        .background(Color("ListBackgraundColor"))
        .cornerRadius(15)
    }
    
}
