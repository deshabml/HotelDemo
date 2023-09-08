//
//  URLManager.swift
//  HotelDemo
//
//  Created by Лаборатория on 07.09.2023.
//

import Foundation

class URLManager {

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

    case hotel = "/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3"
    case hotelRoom = "/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd"

}
