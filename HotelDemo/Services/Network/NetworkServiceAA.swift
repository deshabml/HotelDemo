//
//  NetworkServiceAA.swift
//  HotelDemo
//
//  Created by Лаборатория on 07.09.2023.
//

import Foundation

class NetworkServiceAA {

    static let shared = NetworkServiceAA()
    
    private init() { }

    func getData<T: Decodable>(dataset: T) async throws -> T {
        do {
            let url = try creatUrl(dataset: dataset)
            do {
                let response = try await URLSession.shared.data(from: url)
                let data = response.0
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let itog = try decoder.decode(type(of: dataset).self, from: data)
                    return itog
                } catch {
                    throw NetworkError.invalidDecoding
                }
            } catch { throw NetworkError.badResponse }
        } catch { throw NetworkError.badUrl }
    }
    
    private func creatUrl<T>(dataset: T) throws -> URL {
        let arrayUrl: EndPoint
        switch dataset {
            case _ as Hotel: arrayUrl = .hotel
            default: throw NetworkError.badUrl
        }
        guard let url = URLManager.shared.createUrl(endpoint: arrayUrl) else { throw NetworkError.badUrl }
        return url
    }

}