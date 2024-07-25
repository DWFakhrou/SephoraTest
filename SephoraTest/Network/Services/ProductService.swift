//
//  ProductService.swift
//  SephoraTest
//
//  Created by Mon MacBook on 7/23/24.
//

import Foundation
import UIKit





struct ProductService {
    
    private let api: APIProtocol
    
    init(_ api: APIProtocol = API()) {
        self.api = api
    }
    func perform<T:Decodable>(_ endpoint: Endpoint) async throws -> T {
        let jsonDecoder = JSONDecoderHelper()
        let response = try await api.makeRequest(endpoint)
        let decodedResponse: T = try jsonDecoder.decode(response)
        return decodedResponse
    }
    
    func perform(from url: URL) async throws -> UIImage {
        let data = try await api.makeRequest(from: url)
        guard let image = UIImage(data: data) else { throw RequestErrorType.DecodingError }
        return image
    }
}


protocol Decoder {
    func decode<T: Decodable>(_ data: Data) throws -> T
}

class JSONDecoderHelper: Decoder {
    
    func decode<T: Decodable>(_ data: Data) throws -> T {
        let jsonDecoder = JSONDecoder()
        guard let decodedData = try? jsonDecoder.decode(T.self, from: data) else {        throw RequestErrorType.DecodingError }
        return decodedData
    }
}
