//
//  HotelRoomViewModel.swift
//  HotelDemo
//
//  Created by Лаборатория on 08.09.2023.
//

import Foundation

class HotelRoomViewModel: ObservableObject {

    @Published var rooms: Rooms = Rooms(rooms: [Room.clearRoom])
    var name: String = ""

    init() {
        getData()
    }

    func setupName(name: String) {
        self.name = name
    }

    private func getData() {
        Task {
            do {
                let rooms = try await NetworkServiceAA.shared.getData(dataset: Rooms(rooms: [Room.clearRoom]))
                DispatchQueue.main.async {
                    self.rooms = rooms
                }
            } catch {
                print(error)
            }
        }
    }
    
}
