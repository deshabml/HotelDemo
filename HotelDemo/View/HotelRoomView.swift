//
//  HotelRoomView.swift
//  HotelDemo
//
//  Created by Лаборатория on 06.09.2023.
//

import SwiftUI

struct HotelRoomView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var viewModel = HotelRoomViewModel()

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 8) {
                ForEach(viewModel.rooms.rooms, id: \.self) { room in
                    VStack {
                        HotelRoomCell(viewModel: HotelRoomCellViewModel(room: room))
                    }
                    .background(Color.white)
                    .cornerRadius(12)
                }
            }
            .background(Color("BackgraundGreyColor"))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: buttonBack(complition: {
            self.presentationMode.wrappedValue.dismiss()
        }))
        .navigationTitle("HotelRoom")
        .navigationBarTitleDisplayMode(.inline)
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


