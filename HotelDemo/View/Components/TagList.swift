//
//  TagList.swift
//  HotelDemo
//
//  Created by Лаборатория on 08.09.2023.
//

import SwiftUI

struct TagList: View {
    
    var allTags: [String]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            ForEach(0 ..< self.rowCounts(UIScreen.main.bounds.size.width).count, id: \.self) { rowIndex in
                HStack {
                    ForEach(0 ..< self.rowCounts(UIScreen.main.bounds.size.width)[rowIndex], id: \.self) { itemIndex in
                        TagCell(title: self.tag(rowCounts: self.rowCounts(UIScreen.main.bounds.size.width), rowIndex: rowIndex, itemIndex: itemIndex))
                    }
                }
            }
            Spacer()
        }
    }
    
}

struct TagList_Previews: PreviewProvider {
    
    static var previews: some View {
        TagList(allTags: ["Бесплатный Wifi на всей территории отеля", "1 км до пляжа", "Бесплатный фитнес-клуб", "20 км до аэропорта"])
    }
    
}



extension TagList {
    
    static func rowCounts(tags: [String], padding: CGFloat, parentWidth: CGFloat) -> [Int] {
        let tagWidths = tags.map{$0.widthOfString(usingFont: UIFont.preferredFont(forTextStyle: .headline))}
        var currentLineTotal: CGFloat = 0
        var currentRowCount: Int = 0
        var result: [Int] = []
        for tagWidth in tagWidths {
            let effectiveWidth = tagWidth + (2 * padding)
            if currentLineTotal + effectiveWidth <= parentWidth {
                currentLineTotal += effectiveWidth
                currentRowCount += 1
                guard result.count != 0 else { result.append(1); continue }
                result[result.count - 1] = currentRowCount
            } else {
                currentLineTotal = effectiveWidth
                currentRowCount = 1
                result.append(1)
            }
        }
        return result
    }
    
    private func rowCounts(_ geometry: CGFloat) -> [Int] { TagList.rowCounts(tags: allTags, padding: 8, parentWidth: geometry) }
    
    private func tag(rowCounts: [Int], rowIndex: Int, itemIndex: Int) -> String {
        let sumOfPreviousRows = rowCounts.enumerated().reduce(0) { total, next in
            if next.offset < rowIndex {
                return total + next.element
            } else {
                return total
            }
        }
        let orderedTagsIndex = sumOfPreviousRows + itemIndex
        guard allTags.count > orderedTagsIndex else { return "Error" }
        return allTags[orderedTagsIndex]
    }
    
}
