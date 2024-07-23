//
//  Endpoint.swift
//  SephoraTest
//
//  Created by Mon MacBook on 7/23/24.
//

import Foundation


protocol Endpoint {
    var host: String { get }
    var scheme: String { get }
    var path: String { get }
    var httpMethod: HttpMethod { get }
    var body: [String:String] { get }
    var params: [String:String]  { get }
    var headers: [String:String] { get }
}



enum HttpMethod: String {
    case PUT
    case POST
    case GET
    case PATCH
    case DELETE
}

extension Endpoint {
    var host: String {
        return APIConstants.host
    }
    var scheme: String {
        return APIConstants.scheme
    }
    var body: [String:String] {
        return [:]
    }
    var params: [String:String] {
        return [:]
    }

    var headers: [String:String] {
        return [:]
    }
    
    func generateRequestURL() throws -> URLRequest {

        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path

        guard let url = urlComponents.url else { throw RequestErrorType.invalideURL }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = headers
        if !body.isEmpty {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body)
        }
        return urlRequest
    }

}

enum RequestErrorType : Error {
    case DecodingError
    case invalideURL
    case invalideResponse
    case unauthorized
    case unknown
    
    var message : String {
        switch self {
        case .DecodingError:
            return "Decoding Error"
        case .invalideURL:
            return "Invalide URL"
        case .invalideResponse:
            return "Invalide Response"
        case .unauthorized:
            return "Access Denied"
        case .unknown:
            return "Unkown Error"
        }
    }
}
