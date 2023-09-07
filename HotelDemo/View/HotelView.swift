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
        VStack {
            imageCharacter()
            Text("Наш отель мы так всем рады)")
            Button {
                coordinator.goToHotelRoom()
            } label: {
                Text("Hotel Room")
            }
            Spacer()
        }
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
                    .frame(width: 343, height: 257)
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
    
}
