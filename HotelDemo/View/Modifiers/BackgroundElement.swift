//
//  BackgroundElement.swift
//  HotelDemo
//
//  Created by Лаборатория on 08.09.2023.
//

import SwiftUI

struct BackgroundElement: ViewModifier {

    var name: String
    var completion: (()->())

    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: buttonBack(completion: {
                completion()
            }))
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(name)
    }

}

extension BackgroundElement {

    @ViewBuilder
    func buttonBack(completion: @escaping ()->()) -> some View {
        Button {
            completion()
        } label: {
            Image(systemName: "chevron.backward")
                .foregroundColor(.black)
        }
    }

}
