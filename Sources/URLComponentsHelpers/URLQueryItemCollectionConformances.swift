//
//  URLQueryItemCollectionConformances.swift
//  URLComponentsHelpers
//
//  Created by Jeff Kelley on 2/7/20.
//

import Foundation

extension URLQueryItemCollection: Sequence {
    
    public func makeIterator() -> Array<URLQueryItem>.Iterator {
        return items.makeIterator()
    }
    
}
