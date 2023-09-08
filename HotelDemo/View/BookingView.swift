//
//  BookingView.swift
//  HotelDemo
//
//  Created by Лаборатория on 06.09.2023.
//

import SwiftUI

struct BookingView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var coordinator: Coordinator
    @StateObject var viewModel = BookingViewModel()

    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .modifier(BackgroundElement(name: viewModel.name, completion: {
            self.presentationMode.wrappedValue.dismiss()
        }))
    }
}

struct BookingView_Previews: PreviewProvider {

    static var previews: some View {
        NavigationStack {
            BookingView()
                .environmentObject(Coordinator())
        }
    }

}
