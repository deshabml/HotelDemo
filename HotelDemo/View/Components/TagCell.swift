//
//  TagCell.swift
//  HotelDemo
//
//  Created by Лаборатория on 08.09.2023.
//

import SwiftUI

struct TagCell: View {

    let title: String

    var body: some View {
        Text(title)
            .font(Font.custom("SF Pro Display", size: 16)
                .weight(.medium))
            .foregroundColor(.secondary)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color("BackgraundGreyColor"))
            .cornerRadius(5)
    }
}

struct TagCell_Previews: PreviewProvider {

    static var previews: some View {
        TagCell(title: "Teg")
    }

}
