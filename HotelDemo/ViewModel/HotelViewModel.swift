//
//  HotelViewModel.swift
//  HotelDemo
//
//  Created by Лаборатория on 07.09.2023.
//

import Foundation
import UIKit

class HotelViewModel: ObservableObject {

    @Published var image: UIImage?
    @Published var hotel: Hotel?

    init() {
        getData()
    }

    func getData() {
        Task {
            do {
                let hotel = try await NetworkServiceAA.shared.getData(dataset: Hotel.clearHotel)
                DispatchQueue.main.async {
                    self.hotel = hotel
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }

}
