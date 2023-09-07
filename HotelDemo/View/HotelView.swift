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
//    private var columns: [GridItem] = [
//        GridItem(.adaptive(minimum: 100, maximum: 200)),
////        GridItem(.adaptive(minimum: 100, maximum: 300)),
////        GridItem(.adaptive(minimum: 100, maximum: 300)),
//        GridItem(.adaptive(minimum: 100, maximum: 200))
//    ]

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
//                        LazyVGrid(
//                                        columns: columns
////                                        alignment: .center,
////                                        spacing: 16,
////                                        pinnedViews: [.sectionHeaders, .sectionFooters]
//                                    ) {
//                        Grid(tracks: [.fr(1), .pt(150), .fr(2)]) {
//                            Text("Ehffff")
//                                .gridSpan(column: 2)
//                            Text("Ehffff")
//                                .gridSpan(row: 2)
//                            Text("Ehffff")
//                            Text("Ehffff")
//                            Text("Ehffff")
//                                .gridSpan(column: 2, row: 3)
//                            Text("Ehffff")
//                            Text("Ehffff")
//                                .gridSpan(row: 2)
//                        }
//                        List {
//                        GeometryReader { proxy in
//                            var views: [any View] = []
//                            for i in 0 ..< viewModel.hotel.aboutTheHotel.peculiarities.count {
//                                if viewModel.hotel.aboutTheHotel.peculiarities[i].rect > proxy.frame.width {
//                                    HStack {
//                                        viewModel.hotel.aboutTheHotel.peculiarities[i]
//                                        viewModel.hotel.aboutTheHotel.peculiarities[i + 1]
//
//                                    }
//                                } else {
//                                    HStack {
//                                        viewModel.hotel.aboutTheHotel.peculiarities[i]
//                                    }
//                                }
//
//                            }
//                            ForEach(0 ..< viewModel.hotel.aboutTheHotel.peculiarities.count, id: \.self) { index in
//                                Text(viewModel.hotel.aboutTheHotel.peculiarities[index])
////                                    .fixedSize(horizontal: true, vertical: false)
//                                    .font(.custom("SF Pro Display",
//                                                  size: CGFloat(16)))
//                                    .foregroundColor(.secondary)
////                                    .padding(.horizontal, 10)
////                                    .padding(.vertical, 5)
////                                    .background(Color("BackgraundGreyColor"))
////                                    .gridCellColumns(4)
//                                //                                    .frame(height: 20)
//                            }
//                        }
////                        .frame(maxWidth: 300)
////                        }
//
////                        .frame(maxWidth: .infinity)
////                        .frame(height: 100)
////                            ForEach(0 ..< viewModel.hotel.aboutTheHotel.peculiarities.count, id: \.self) { index in
////                                Text(viewModel.hotel.aboutTheHotel.peculiarities[index])
////                                    .font(.custom("SF Pro Display",
////                                                  size: CGFloat(16)))
////                                    .foregroundColor(.secondary)
////                                    .padding(.horizontal, 10)
////                                    .padding(.vertical, 5)
////                                    .background(Color("BackgraundGreyColor"))
//////                                    .frame(height: 20)
////                            }
//
////                        }
////                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                        ///

                        Text(viewModel.hotel.aboutTheHotel.description)
                            .font(.custom("SF Pro Display",
                                          size: CGFloat(16)))
                        ditailedList()
                    }
                    .padding()
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
            .font(.custom("SF Pro Display",
                          size: CGFloat(16)))
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
                    .font(.custom("SF Pro Display",
                                  size: CGFloat(30)))
                    .bold()
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
