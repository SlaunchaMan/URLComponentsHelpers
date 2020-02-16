import Foundation

public struct URLQueryItemCollection {
    
    private var storage: [URLQueryItem] = []
    
    public init(_ queryItems: [URLQueryItem]) {
        storage = queryItems
    }
    
    mutating public func append(name: String, value: String?) {
        storage.append(URLQueryItem(name: name, value: value))
    }
    
    public var items: [URLQueryItem] { storage }
    
}

extension URLQueryItemCollection: ExpressibleByDictionaryLiteral {
    
    public typealias Key = String
    public typealias Value = String?
    
    public init(dictionaryLiteral elements: (String, String?)...) {
        storage = elements.map { URLQueryItem(name: $0, value: $1) }
    }
    
}

public extension URLComponents {
    
    mutating func setQueryItems(_ collection: URLQueryItemCollection) {
        queryItems = collection.items
    }
    
}

extension Array where Element == URLQueryItem {
    
    subscript(named name: String) -> String? {
        return first(where: { $0.name == name })?.value
    }
    
}
