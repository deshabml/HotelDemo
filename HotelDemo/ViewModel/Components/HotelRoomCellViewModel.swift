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

    init(room: Room) {
        self.room = room
        imagesCharacterVM.getImages(urls: room.imageUrls)
        tagListVM.setupTags(allTags: room.peculiarities)
    }

    func preisFormat() -> String {
        let priseStringArray = Array(String(room.price)).map { String($0) }
        var priseString = ""
        for index in 0 ..< priseStringArray.count {
            priseString += priseStringArray[index]
            if (priseStringArray.count - 1 - index) % 3 == 0 {
                priseString += " "
            }
        }
        let itog = " " + priseString  + " ₽"
        return itog
    }
    
}
