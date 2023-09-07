//
//  HotelViewModel.swift
//  HotelDemo
//
//  Created by Лаборатория on 07.09.2023.
//

import Foundation
import UIKit

class HotelViewModel: ObservableObject {

    @Published var images: [UIImage]?
    @Published var hotel = Hotel.clearHotel

    init() {
        getData()
    }

    private func getData() {
        Task {
            do {
                let hotel = try await NetworkServiceAA.shared.getData(dataset: Hotel.clearHotel)
                DispatchQueue.main.async {
                    self.hotel = hotel
                    self.getImages()
                }
            } catch {
                print(error)
            }
        }
    }

    func preisFormat() -> String {
        let priseStringArray = Array(String(hotel.minimalPrice)).map { String($0) }
        var priseString = ""
        for index in 0 ..< priseStringArray.count {
            priseString += priseStringArray[index]
            if (priseStringArray.count - 1 - index) % 3 == 0 {
                priseString += " "
            }
        }
        let itog = "от " + priseString  + " ₽"
        return itog
    }

    func getImages() {
        let imageUrls = hotel.imageUrls
        imageUrls.forEach { url in
            Task {
                do {
                    let image = try await NetworkServiceAA.shared.downloadImage(url: url)
                    DispatchQueue.main.async {
                        if let _ = self.images {
                            self.images?.append(image)
                        } else {
                            self.images = [image]
                        }
                    }
                } catch {
                    print(error)
                }
            }
        }
    }
    
    func colorBarImageElement(index: Int, currentIndex: Int) -> Double {
        if currentIndex == index {
            return 1
        } else {
            if currentIndex > index {
                return Double(index + 1) / Double(currentIndex * 5)
            } else {
                return Double(currentIndex + 1) / Double(index * 5)
            }
        }
    }
    
}
