//
//  ButtonGoToViewModel.swift
//  HotelDemo
//
//  Created by Лаборатория on 08.09.2023.
//

import Foundation

class ButtonGoToViewModel: ObservableObject {

    let title: String
    var completion: ()->()

    init(title: String, completion: @escaping ()->()) {
        self.completion = completion
        self.title = title
    }

}
