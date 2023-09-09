//
//  PaidViewModel.swift
//  HotelDemo
//
//  Created by Лаборатория on 09.09.2023.
//

import Foundation

final class PaidViewModel: ObservableObject {

    let name = "Заказ оплачен"
    let buttonGoToVM = ButtonGoToViewModel(title: "Супер!")
    var orderConfirmation: String {
        "Подтверждение заказа №\(Int.random(in: 100000..<999999)) может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление."
    }
    
}
