//
//  HotelView.swift
//  HotelDemo
//
//  Created by Лаборатория on 06.09.2023.
//

import SwiftUI

struct HotelView: View {

    @EnvironmentObject var coordinator: Coordinator

    var body: some View {
        VStack {
            Text("Наш отель мы так всем рады)")
            Button {
                coordinator.goToHotelRoom()
            } label: {
                Text("Hotel Room")
            }

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
