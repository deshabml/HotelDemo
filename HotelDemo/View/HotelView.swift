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
        ScrollView {
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
        //        .animation(.easeInOut, value: selectedTab)
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
        HStack(spacing: 4) {
            Image(systemName: "star.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 15, height: 15)
            Text("\(rating)" + " " + ratingName)
            Spacer()
        }
        .font(.custom("SF-Pro-Display-Regular",
                      size: CGFloat(16)))
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .foregroundColor(Color("OrangeColor"))
        .background(Color("YellovLiteColor"))
        .cornerRadius(5)
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
                    .font(.custom("SF Pro Display",
                                  size: CGFloat(30)))
                    .bold()
                Text(viewModel.hotel.priceForIt.lowercased())
                    .foregroundColor(.secondary)
                    .font(.custom("SF Pro Display", size: CGFloat(16)))
            }
        }
    }

}
