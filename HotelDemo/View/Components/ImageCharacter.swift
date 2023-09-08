//
//  ImageCharacter.swift
//  HotelDemo
//
//  Created by Лаборатория on 08.09.2023.
//

import SwiftUI

struct ImageCharacter: View {

    @StateObject var viewModel: ImageCharacterViewModel
    @State private var currentIndex = 0

    var body: some View {
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

}

struct ImageCharacter_Previews: PreviewProvider {

    static var previews: some View {
        ImageCharacter(viewModel: ImageCharacterViewModel())
    }

}
