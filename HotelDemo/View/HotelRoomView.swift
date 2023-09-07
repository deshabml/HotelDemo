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

    var body: some View {
        VStack {
            Text("HotelRoom")
        }
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


