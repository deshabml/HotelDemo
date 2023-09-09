//
//  PriceViewModel.swift
//  HotelDemo
//
//  Created by Лаборатория on 08.09.2023.
//

import Foundation

final class PriceViewModel: ObservableObject {

    var price: Int = 0
    var priceForIt: String = ""
    var isInitialPrice: Bool = false

    init() { }
    
    init(price: Int, priceForIt: String, isInitialPrice: Bool = false) {
        self.price = price
        self.priceForIt = priceForIt
        self.isInitialPrice = isInitialPrice
    }

    func setup(price: Int, priceForIt: String, isInitialPrice: Bool = false) {
        self.price = price
        self.priceForIt = priceForIt
        self.isInitialPrice = isInitialPrice
    }



    func priceFormat() -> String {
        let priseStringArray = Array(String(price)).map { String($0) }
        var priseString = ""
        for index in 0 ..< priseStringArray.count {
            priseString += priseStringArray[index]
            if (priseStringArray.count - 1 - index) % 3 == 0 {
                priseString += " "
            }
        }
        let itog = (isInitialPrice ? "от " : " ") + priseString  + " ₽"
        return itog
    }
    
}
