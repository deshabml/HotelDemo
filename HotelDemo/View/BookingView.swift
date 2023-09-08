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
        ScrollView(showsIndicators: false) {
            VStack(spacing: 8) {
                
            }
            .background(Color("BackgraundGreyColor"))
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
