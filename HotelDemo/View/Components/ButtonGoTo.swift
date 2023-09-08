//
//  ButtonGoTo.swift
//  HotelDemo
//
//  Created by Лаборатория on 08.09.2023.
//

import SwiftUI

struct ButtonGoTo: View {

    @StateObject var viewModel: ButtonGoToViewModel

    var body: some View {
        HStack {
            Spacer()
            Button {
                viewModel.completion()
            } label: {
                HStack {
                    Spacer()
                    Text(viewModel.title)
                        .foregroundColor(Color.white)
                        .font(.custom("SF Pro Display",
                                      size: CGFloat(16)))
                    Spacer()
                }
                .padding()
                .background(Color.blue)
                .cornerRadius(16)
            }
            Spacer()
        }
    }

}

struct ButtonGoTo_Previews: PreviewProvider {

    static var previews: some View {
        ButtonGoTo(viewModel: ButtonGoToViewModel(title: "Title", completion: { }))
    }

}
