//
//  ActivityIndicator.swift
//  HotelDemo
//
//  Created by Лаборатория on 07.09.2023.
//

import SwiftUI

struct ActivityIndicator: View {

    @StateObject private var viewModel = ActivityIndicatorViewModel()

    var body: some View {
        GeometryReader { (geometry: GeometryProxy) in
            ForEach(0..<12) { index in
                Group {
                    Rectangle()
                        .cornerRadius(geometry.size.width / 5)
                        .frame(width: geometry.size.width / 8, height: geometry.size.height / 3)
                        .offset(y: geometry.size.width / 2.25)
                        .rotationEffect(.degrees(Double(-360 * index / 12)))
                        .opacity(viewModel.setOpacity(for: index))
                }.frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .onAppear {
            viewModel.incrementIndex()
        }
    }

}

struct ActivityIndicator_Previews: PreviewProvider {

    static var previews: some View {
        ActivityIndicator()
            .frame(width: 50, height: 50)
            .foregroundColor(.blue)
    }

}

