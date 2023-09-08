//
//  ImageCharacter.swift
//  HotelDemo
//
//  Created by Лаборатория on 08.09.2023.
//

import UIKit

class ImageCharacterViewModel: ObservableObject {

    @Published var images: [UIImage]?

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

    func getImages(urls: [String]) {
        let imageUrls = urls
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

}
