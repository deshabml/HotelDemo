//
//  URLManager.swift
//  HotelDemo
//
//  Created by Лаборатория on 07.09.2023.
//

import Foundation

final class URLManager {

    static let shared = URLManager()
    private let tunnel = "https://"
    private let server = Server.prod

    private init() { }

    func createUrl(endpoint: EndPoint) -> URL? {
        let urlStr = tunnel + server.rawValue + endpoint.rawValue
        return URL(string: urlStr)
    }

}

enum Server: String {

    case prod = "run.mocky.io"

}

enum EndPoint: String {

    case hotel = "/v3/9dcf1c93-10dd-4d99-8f47-874d92883a9c"
//    case hotel = "/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3"
    case hotelRoom = "/v3/2a8ee4bb-ab26-4587-8881-bc85462a50c1"
//    case hotelRoom = "/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd"
    case booking = "/v3/8be37676-d6bb-47db-81d5-760add161326"
//    case booking = "/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8"
}
