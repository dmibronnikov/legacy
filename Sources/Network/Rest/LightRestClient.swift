//
// LightRestClient
// Legacy
//
// Copyright (c) 2015 Eugene Egorov.
// License: MIT, https://github.com/eugeneego/legacy/blob/master/LICENSE
//

import Foundation

public protocol LightRestClient: RestClient, LightNetworkClient {
    @discardableResult
    func create<RequestTransformer: LightTransformer, ResponseTransformer: LightTransformer>(
        path: String, id: String?, object: RequestTransformer.T?, headers: [String: String],
        requestTransformer: RequestTransformer, responseTransformer: ResponseTransformer,
        completion: @escaping (Result<ResponseTransformer.T, NetworkError>) -> Void
    ) -> NetworkTask

    @discardableResult
    func create<ResponseTransformer: LightTransformer>(
        path: String, id: String?, data: Data?, contentType: String, headers: [String: String],
        responseTransformer: ResponseTransformer,
        completion: @escaping (Result<ResponseTransformer.T, NetworkError>) -> Void
    ) -> NetworkTask

    @discardableResult
    func read<ResponseTransformer: LightTransformer>(
        path: String, id: String?, parameters: [String: String], headers: [String: String],
        responseTransformer: ResponseTransformer,
        completion: @escaping (Result<ResponseTransformer.T, NetworkError>) -> Void
    ) -> NetworkTask

    @discardableResult
    func update<RequestTransformer: LightTransformer, ResponseTransformer: LightTransformer>(
        path: String, id: String?, object: RequestTransformer.T?, headers: [String: String],
        requestTransformer: RequestTransformer, responseTransformer: ResponseTransformer,
        completion: @escaping (Result<ResponseTransformer.T, NetworkError>) -> Void
    ) -> NetworkTask

    @discardableResult
    func update<ResponseTransformer: LightTransformer>(
        path: String, id: String?, data: Data?, contentType: String, headers: [String: String],
        responseTransformer: ResponseTransformer,
        completion: @escaping (Result<ResponseTransformer.T, NetworkError>) -> Void
    ) -> NetworkTask

    @discardableResult
    func delete<ResponseTransformer: LightTransformer>(
        path: String, id: String?, headers: [String: String],
        responseTransformer: ResponseTransformer,
        completion: @escaping (Result<ResponseTransformer.T, NetworkError>) -> Void
    ) -> NetworkTask
}

public extension LightRestClient {
    @discardableResult
    public func create<RequestTransformer: LightTransformer, ResponseTransformer: LightTransformer>(
        path: String, id: String?, object: RequestTransformer.T?, headers: [String: String],
        requestTransformer: RequestTransformer, responseTransformer: ResponseTransformer,
        completion: @escaping (Result<ResponseTransformer.T, NetworkError>) -> Void
    ) -> NetworkTask {
        return request(
            method: .post,
            path: pathWithId(path: path, id: id),
            parameters: [:],
            object: object,
            headers: headers,
            requestTransformer: requestTransformer,
            responseTransformer: responseTransformer,
            completion: completion
        )
    }

    @discardableResult
    public func create<ResponseTransformer: LightTransformer>(
        path: String, id: String?, data: Data?, contentType: String, headers: [String: String],
        responseTransformer: ResponseTransformer,
        completion: @escaping (Result<ResponseTransformer.T, NetworkError>) -> Void
    ) -> NetworkTask {
        return request(
            method: .post,
            path: pathWithId(path: path, id: id),
            parameters: [:],
            object: data,
            headers: headers,
            requestSerializer: DataHttpSerializer(contentType: contentType),
            responseSerializer: JsonModelLightTransformerHttpSerializer(transformer: responseTransformer),
            completion: completion
        )
    }

    @discardableResult
    public func read<ResponseTransformer: LightTransformer>(
        path: String, id: String?, parameters: [String: String], headers: [String: String],
        responseTransformer: ResponseTransformer,
        completion: @escaping (Result<ResponseTransformer.T, NetworkError>) -> Void
    ) -> NetworkTask {
        return request(
            method: .get,
            path: pathWithId(path: path, id: id),
            parameters: parameters,
            object: nil,
            headers: headers,
            requestTransformer: VoidLightTransformer(),
            responseTransformer: responseTransformer,
            completion: completion
        )
    }

    @discardableResult
    public func update<RequestTransformer: LightTransformer, ResponseTransformer: LightTransformer>(
        path: String, id: String?, object: RequestTransformer.T?, headers: [String: String],
        requestTransformer: RequestTransformer, responseTransformer: ResponseTransformer,
        completion: @escaping (Result<ResponseTransformer.T, NetworkError>) -> Void
    ) -> NetworkTask {
        return request(
            method: .put,
            path: pathWithId(path: path, id: id),
            parameters: [:],
            object: object,
            headers: headers,
            requestTransformer: requestTransformer,
            responseTransformer: responseTransformer,
            completion: completion
        )
    }

    @discardableResult
    public func update<ResponseTransformer: LightTransformer>(
        path: String, id: String?, data: Data?, contentType: String, headers: [String: String],
        responseTransformer: ResponseTransformer,
        completion: @escaping (Result<ResponseTransformer.T, NetworkError>) -> Void
    ) -> NetworkTask {
        return request(
            method: .put,
            path: pathWithId(path: path, id: id),
            parameters: [:],
            object: data,
            headers: headers,
            requestSerializer: DataHttpSerializer(contentType: contentType),
            responseSerializer: JsonModelLightTransformerHttpSerializer(transformer: responseTransformer),
            completion: completion
        )
    }

    @discardableResult
    public func delete<ResponseTransformer: LightTransformer>(
        path: String, id: String?, headers: [String: String],
        responseTransformer: ResponseTransformer,
        completion: @escaping (Result<ResponseTransformer.T, NetworkError>) -> Void
    ) -> NetworkTask {
        return request(
            method: .delete,
            path: pathWithId(path: path, id: id),
            parameters: [:],
            object: nil,
            headers: headers,
            requestTransformer: VoidLightTransformer(),
            responseTransformer: responseTransformer,
            completion: completion
        )
    }
}
