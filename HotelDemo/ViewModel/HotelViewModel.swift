//
//  HotelViewModel.swift
//  HotelDemo
//
//  Created by Лаборатория on 07.09.2023.
//

import Foundation
import UIKit

class HotelViewModel: ObservableObject {

    @Published var hotel = Hotel.clearHotel
    let detailedInfo = [Detailed(name: "Удобства", imegeName: "Happy"),
                        Detailed(name: "Что включено", imegeName: "TickSquare"),
                        Detailed(name: "Что не включено", imegeName: "CloseSquare")]
    let imagesCharacterVM = ImageCharacterViewModel()
    let tagListVM = TagListViewModel()

    init() {
        getData()
    }

    private func getData() {
        Task {
            do {
                let hotel = try await NetworkServiceAA.shared.getData(dataset: Hotel.clearHotel)
                DispatchQueue.main.async {
                    self.hotel = hotel
                    self.imagesCharacterVM.getImages(urls: hotel.imageUrls)
                    self.tagListVM.setupTags(allTags: hotel.aboutTheHotel.peculiarities)
                }
            } catch {
                print(error)
            }
        }
    }

    func preisFormat() -> String {
        let priseStringArray = Array(String(hotel.minimalPrice)).map { String($0) }
        var priseString = ""
        for index in 0 ..< priseStringArray.count {
            priseString += priseStringArray[index]
            if (priseStringArray.count - 1 - index) % 3 == 0 {
                priseString += " "
            }
        }
        let itog = "от " + priseString  + " ₽"
        return itog
    }

}
