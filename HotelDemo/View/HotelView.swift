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
    @State private var currentIndex = 0

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (spacing: 16) {
                VStack {
                    VStack(spacing: 16) {
                        imageCharacter()
                        basicInformation()
                    }
                    .padding()
                }
                .background(Color.white)
                .cornerRadius(12)
                VStack {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Об отеле")
                            .font(.custom("SF Pro Display",
                                          size: CGFloat(22)))
                        TagList(allTags: viewModel.hotel.aboutTheHotel.peculiarities)
                        Text(viewModel.hotel.aboutTheHotel.description)
                            .font(.custom("SF Pro Display",
                                          size: CGFloat(16)))
                        ditailedList()
                    }
                    .padding()
                }
                .background(Color.white)
                .cornerRadius(12)
                VStack {
                    HStack {
                        Spacer()
                        Button {
                            coordinator.goToHotelRoom()
                        } label: {
                            HStack {
                                Spacer()
                                Text("К выбору номера")
                                    .foregroundColor(Color.white)
                                    .font(.custom("SF Pro Display",
                                                  size: CGFloat(16)))
                                Spacer()
                            }
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(16)
                        }
                        Spacer()
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

    private func imageCharacter() -> some View {
        VStack {
            if let images = viewModel.images {
                TabView(selection: $currentIndex) {
                    ForEach(0 ..< images.count, id: \.self) { index in
                        Image(uiImage: images[index])
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity)
                            .clipped()
                            .background(.black)
                    }
                }
                .frame(height: 257)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .cornerRadius(15)
                .overlay {
                    VStack {
                        Spacer()
                        HStack(spacing: 5) {
                            ForEach(0..<images.count, id: \.self) { index in
                                Circle()
                                    .frame(width: 7, height: 7)
                                    .foregroundColor(.black.opacity(viewModel.colorBarImageElement(index: index, currentIndex: currentIndex)))
                                    .onTapGesture {
                                        withAnimation {
                                            currentIndex = index
                                        }
                                    }
                            }
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color.white)
                        .cornerRadius(5)
                        .padding(8)
                    }
                }
            } else {
                ActivityIndicator()
                    .frame(width: 100, height: 257)
                    .foregroundColor(.gray)
            }
        }
    }

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
        VStack(alignment: .leading, spacing: 12) {
            rating(rating: viewModel.hotel.rating, ratingName: viewModel.hotel.ratingName)
            Text(viewModel.hotel.name)
                .font(.custom("SF Pro Display",
                              size: CGFloat(22)))
            Button {
            } label: {
                Text(viewModel.hotel.adress)
                    .font(.custom("SF Pro Display",
                                  size: CGFloat(14)))
            }
            HStack(alignment: .bottom) {
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
