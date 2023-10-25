//
//  HotelRoomView.swift
//  HotelDemo
//
//  Created by Лаборатория on 06.09.2023.
//

import SwiftUI

struct HotelRoomView: View {

    @EnvironmentObject var coordinator: Coordinator
    @StateObject var viewModel = HotelRoomViewModel()

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 8) {
                ForEach(viewModel.rooms.rooms, id: \.self) { room in
                    VStack {
                        HotelRoomCell(viewModel: HotelRoomCellViewModel(room: room))
                            .environmentObject(coordinator)
                    }
                    .background(Color.white)
                    .cornerRadius(12)
                }
            }
            .background(Color("BackgraundGreyColor"))
        }
        .modifier(BackgroundElement(name: viewModel.name, completion: {
            coordinator.goBack()
        }))
        .onAppear {
            viewModel.setupName(name: coordinator.hotelName)
        }
    }
    
}

struct HotelRoomView_Previews: PreviewProvider {

    static var previews: some View {
        NavigationStack {
            HotelRoomView()
                .environmentObject(Coordinator())
        }
    }

}


