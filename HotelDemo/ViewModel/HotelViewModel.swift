//
//  HotelViewModel.swift
//  HotelDemo
//
//  Created by Лаборатория on 07.09.2023.
//

import Foundation
import UIKit

final class HotelViewModel: ObservableObject {

    @Published var hotel = Hotel.clearHotel
    let detailedInfo = [Detailed(name: "Удобства", imegeName: "Happy"),
                        Detailed(name: "Что включено", imegeName: "TickSquare"),
                        Detailed(name: "Что не включено", imegeName: "CloseSquare")]
    let imagesCharacterVM = ImageCharacterViewModel()
    let tagListVM = TagListViewModel()
    let basicInfoVM = BasicInformationViewModel()
    let priceVM = PriceViewModel()

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
                    self.basicInfoVM.setup(rating: hotel.rating,
                                           ratingName: hotel.ratingName,
                                           hotelName: hotel.name,
                                           hotelAdress: hotel.adress)
                    self.priceVM.setup(price: hotel.minimalPrice,
                                       priceForIt: hotel.priceForIt,
                                       isInitialPrice: true)
                }
            } catch {
                print(error)
            }
        }
    }

}
