//
//  HotelRoomCellViewModel.swift
//  HotelDemo
//
//  Created by Лаборатория on 08.09.2023.
//

import Foundation

class HotelRoomCellViewModel: ObservableObject {

    let room: Room
    let imagesCharacterVM = ImageCharacterViewModel()
    let tagListVM = TagListViewModel()
    let priceVM = PriceViewModel()

    init(room: Room) {
        self.room = room
        imagesCharacterVM.getImages(urls: room.imageUrls)
        tagListVM.setupTags(allTags: room.peculiarities)
        priceVM.setup(price: room.price,
                      priceForIt: room.pricePer)
    }

}
