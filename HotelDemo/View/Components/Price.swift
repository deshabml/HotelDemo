//
//  Price.swift
//  HotelDemo
//
//  Created by Лаборатория on 08.09.2023.
//

import SwiftUI

struct Price: View {

    @StateObject var viewModel: PriceViewModel

    var body: some View {
        HStack(alignment: .bottom, spacing: 8) {
            Text(viewModel.priceFormat())
                .font(Font.custom("SF Pro Display", size: 30)
                    .weight(.semibold))
            Text(viewModel.priceForIt.lowercased())
                .foregroundColor(.secondary)
                .font(.custom("SF Pro Display", size: CGFloat(16)))
        }
    }

}

struct Price_Previews: PreviewProvider {

    static var previews: some View {
        Price(viewModel: PriceViewModel(price: 10_000, priceForIt: "цена"))
    }
    
}
