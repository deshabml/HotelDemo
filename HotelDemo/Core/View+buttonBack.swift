//
//  View+buttonBack.swift
//  HotelDemo
//
//  Created by Лаборатория on 07.09.2023.
//

import SwiftUI

extension View {

    @ViewBuilder
    func buttonBack(complition: @escaping ()->()) -> some View {
        Button {
            complition()
        } label: {
            Image(systemName: "chevron.backward")
                .foregroundColor(.black)
        }
    }

}
