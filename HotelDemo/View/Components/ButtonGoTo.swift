//
//  ButtonGoTo.swift
//  HotelDemo
//
//  Created by Лаборатория on 08.09.2023.
//

import SwiftUI

struct ButtonGoTo: View {

    @StateObject var viewModel: ButtonGoToViewModel
    var completion: ()->()

    var body: some View {
        HStack {
            Spacer()
            Button {
                completion()
            } label: {
                Text(viewModel.title)
                    .foregroundColor(Color.white)
                    .font(.custom("SF Pro Display",
                                  size: CGFloat(16))
                        .weight(.medium))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .background(Color.blue)
                    .cornerRadius(16)
            }
            Spacer()
        }
    }

}

struct ButtonGoTo_Previews: PreviewProvider {

    static var previews: some View {
        ButtonGoTo(viewModel: ButtonGoToViewModel(title: "Title")) { }
    }

}
