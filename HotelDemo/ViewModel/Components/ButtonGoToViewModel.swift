//
//  ButtonGoToViewModel.swift
//  HotelDemo
//
//  Created by Лаборатория on 08.09.2023.
//

import Foundation

final class ButtonGoToViewModel: ObservableObject {

    @Published var title: String

    init(title: String) {
        self.title = title
    }

}
