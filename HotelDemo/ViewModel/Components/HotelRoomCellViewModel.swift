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

    init(room: Room) {
        self.room = room
        imagesCharacterVM.getImages(urls: room.imageUrls)
    }
    
}
