//
//  TagList.swift
//  HotelDemo
//
//  Created by Лаборатория on 08.09.2023.
//

import SwiftUI

struct TagList: View {

    @StateObject var viewModel: TagListViewModel

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0 ..< viewModel.rowCounts(UIScreen.main.bounds.size.width).count, id: \.self) { rowIndex in
                HStack {
                    ForEach(0 ..< viewModel.rowCounts(UIScreen.main.bounds.size.width)[rowIndex], id: \.self) { itemIndex in
                        TagCell(viewModel: TagCellViewModel(title: viewModel.tag(rowCounts: viewModel.rowCounts(UIScreen.main.bounds.size.width), rowIndex: rowIndex, itemIndex: itemIndex)))
                    }
                }
            }
        }
    }

}

struct TagList_Previews: PreviewProvider {

    static var previews: some View {
        TagList(viewModel: TagListViewModel(allTags: ["Бесплатный Wifi на всей территории отеля", "1 км до пляжа", "Бесплатный фитнес-клуб", "20 км до аэропорта"]))
    }

}
