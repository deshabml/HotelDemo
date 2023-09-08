//
//  HotelRoomCell.swift
//  HotelDemo
//
//  Created by Лаборатория on 08.09.2023.
//

import SwiftUI

struct HotelRoomCell: View {

    @StateObject var viewModel: HotelRoomCellViewModel

    var body: some View {
        VStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                ImageCharacter(viewModel: viewModel.imagesCharacterVM)
                Text(viewModel.room.name)
                    .font(Font.custom("SF Pro Display", size: 22)
                        .weight(.medium))
                TagList(viewModel: viewModel.tagListVM)
                buttonMoreDetails()
            }
            VStack(alignment: .leading, spacing: 8) {
                basicInformation()
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }

}

struct HotelRoomCell_Previews: PreviewProvider {

    static var previews: some View {
        HotelRoomCell(viewModel: HotelRoomCellViewModel(room: Room(id: 2, name: "Люкс номер с видом на море", price: 289400, pricePer: "За 7 ночей с перелетом", peculiarities: ["Все включено", "Кондиционер", "Собственный бассейн"], imageUrls: ["https://mmf5angy.twic.pics/ahstatic/www.ahstatic.com/photos/b1j0_roskdc_00_p_1024x768.jpg?ritok=65&twic=v1/cover=800x600", "https://www.google.com/search?q=%D0%BD%D0%BE%D0%BC%D0%B5%D1%80+%D0%BB%D1%8E%D0%BA%D1%81+%D0%B2+%D0%BE%D1%82%D0%B5%D0%BB%D0%B8+%D0%B5%D0%B3%D0%B8%D0%BF%D1%82%D0%B0+%D1%81+%D1%81%D0%BE%D0%B1%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D1%8B%D0%BC+%D0%B1%D0%B0%D1%81%D1%81%D0%B5%D0%B9%D0%BD%D0%BE%D0%BC&tbm=isch&ved=2ahUKEwilufKp-4KBAxUfJxAIHR4uAToQ2-cCegQIABAA&oq=%D0%BD%D0%BE%D0%BC%D0%B5%D1%80+%D0%BB%D1%8E%D0%BA%D1%81+%D0%B2+%D0%BE%D1%82%D0%B5%D0%BB%D0%B8+%D0%B5%D0%B3%D0%B8%D0%BF%D1%82%D0%B0+%D1%81+%D1%81%D0%BE%D0%B1%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D1%8B%D0%BC+%D0%B1%D0%B0%D1%81%D1%81%D0%B5%D0%B9%D0%BD%D0%BE%D0%BC&gs_lcp=CgNpbWcQAzoECCMQJ1CqAVi6HGDmHWgAcAB4AIABXIgB3wySAQIyNZgBAKABAaoBC2d3cy13aXotaW1nwAEB&sclient=img&ei=Y3fuZOX7KJ_OwPAPntyE0AM&bih=815&biw=1440#imgrc=Nr2wzh3vuY4jEM&imgdii=zTCXWbFgrQ5HBM", "https://tour-find.ru/thumb/2/bsb2EIEFA8nm22MvHqMLlw/r/d/screenshot_3_94.png"])))
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

    private func basicInformation() -> some View {
        HStack(alignment: .bottom, spacing: 8) {
            Text(viewModel.preisFormat())
                .font(Font.custom("SF Pro Display", size: 30)
                    .weight(.semibold))
            Text(viewModel.room.pricePer.lowercased())
                .foregroundColor(.secondary)
                .font(.custom("SF Pro Display", size: CGFloat(16)))
        }
    }

}
