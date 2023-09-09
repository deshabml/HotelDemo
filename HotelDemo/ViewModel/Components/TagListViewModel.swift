//
//  TagListViewModel.swift
//  HotelDemo
//
//  Created by Лаборатория on 08.09.2023.
//

import UIKit

final class TagListViewModel: ObservableObject {

    @Published var allTags: [String] = []

    init() {}
    
    init(allTags: [String]) {
        self.allTags = allTags
    }

    func setupTags(allTags: [String]) {
        self.allTags = allTags
    }

    func rowCounts(tags: [String], padding: CGFloat, parentWidth: CGFloat) -> [Int] {
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

    func rowCounts(_ geometry: CGFloat) -> [Int] { rowCounts(tags: allTags, padding: 8, parentWidth: geometry) }

    func tag(rowCounts: [Int], rowIndex: Int, itemIndex: Int) -> String {
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
