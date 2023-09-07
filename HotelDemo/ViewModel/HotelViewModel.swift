//
//  HotelViewModel.swift
//  HotelDemo
//
//  Created by Лаборатория on 07.09.2023.
//

import Foundation
import UIKit

class HotelViewModel: ObservableObject {

    @Published var image: UIImage?
    @Published var hotel: Hotel?

    init() {
        getData()
    }

    private func getData() {
        Task {
            do {
                let hotel = try await NetworkServiceAA.shared.getData(dataset: Hotel.clearHotel)
                DispatchQueue.main.async {
                    self.hotel = hotel
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func preisFormat(prise: Int) -> String {
        let priseStringArray = Array(String(prise)).map { String($0) }
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
