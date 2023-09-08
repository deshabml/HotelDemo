//
//  HotelRoomCell.swift
//  HotelDemo
//
//  Created by Лаборатория on 08.09.2023.
//

import SwiftUI

struct HotelRoomCell: View {

    @EnvironmentObject var coordinator: Coordinator
    @StateObject var viewModel: HotelRoomCellViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                ImageCharacter(viewModel: viewModel.imagesCharacterVM)
                Text(viewModel.room.name)
                    .font(Font.custom("SF Pro Display", size: 22)
                        .weight(.medium))
                TagList(viewModel: viewModel.tagListVM)
                buttonMoreDetails()
            }
            Price(viewModel: viewModel.priceVM)
            ButtonGoTo(viewModel: ButtonGoToViewModel(title: "Выбрать номер",
                                                      completion: {coordinator.goToBookingView()}))
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }
    
}

struct HotelRoomCell_Previews: PreviewProvider {

    static var previews: some View {
        HotelRoomCell(viewModel: HotelRoomCellViewModel(room: Room(id: 2, name: "Люкс номер с видом на море", price: 289400, pricePer: "За 7 ночей с перелетом", peculiarities: ["Все включено", "Кондиционер", "Собственный бассейн"], imageUrls: ["https://mmf5angy.twic.pics/ahstatic/www.ahstatic.com/photos/b1j0_roskdc_00_p_1024x768.jpg?ritok=65&twic=v1/cover=800x600", "https://tour-find.ru/thumb/2/bsb2EIEFA8nm22MvHqMLlw/r/d/screenshot_3_94.png"])))
    }

}

extension HotelRoomCell {

    private func buttonMoreDetails() -> some View {
        Button {
        } label: {
            HStack(alignment: .center, spacing: 2) {
                Text("Подробнее о номере")
                Image(systemName: "chevron.right")
            }
            .font(
                Font.custom("SF Pro Display", size: 16)
                    .weight(.medium))
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color(red: 0.05, green: 0.45, blue: 1).opacity(0.1))
            .cornerRadius(5)
        }
    }

}
