import XCTest
import URLComponentsHelpers

final class URLComponentsHelpersTests: XCTestCase {
    
    func testLinuxTestSuiteIncludesAllTests() {
        #if os(macOS) || os(iOS) || os(tvOS) || os(watchOS)
        let thisClass = type(of: self)
        let linuxCount = thisClass.allTests.count
        let darwinCount = Int(thisClass.defaultTestSuite.testCaseCount)
        
        XCTAssertEqual(
            linuxCount,
            darwinCount,
            "\(darwinCount - linuxCount) test(s) missing from allTests"
        )
        #endif
    }
    
    func testCreatingQueryItemCollectionManually() {
        let collection = URLQueryItemCollection([
            URLQueryItem(name: "foo", value: "foo"),
            URLQueryItem(name: "bar", value: "baz")
        ])
        
        var components = URLComponents()
        components.host = "example.com"
        components.scheme = "https"
        components.path = "/index.html"
        components.queryItems = collection.items
        
        XCTAssertEqual(components.url?.absoluteString,
                       "https://example.com/index.html?foo=foo&bar=baz")
    }
    
    func testCreatingQueryItemCollectionWithDictionaryLiteral() {
        var components = URLComponents()
        components.host = "example.com"
        components.scheme = "https"
        components.path = "/index.html"
        
        components.setQueryItems(["foo": "foo", "bar": "baz"])
        
        XCTAssertEqual(components.url?.absoluteString,
                       "https://example.com/index.html?foo=foo&bar=baz")
    }
    
    func testCreatingQueryItemCollectionWithNilValue() {
        let collection = URLQueryItemCollection([
            URLQueryItem(name: "foo", value: "foo"),
            URLQueryItem(name: "bar", value: nil)
        ])
        
        var components = URLComponents()
        components.host = "example.com"
        components.scheme = "https"
        components.path = "/index.html"
        components.queryItems = collection.items
        
        XCTAssertEqual(components.url?.absoluteString,
                       "https://example.com/index.html?foo=foo&bar")
    }
    
    func testAppendingQueryItems() {
        var collection: URLQueryItemCollection = [
            "foo": "foo"
        ]
        
        collection.append(name: "bar", value: "baz")

        var components = URLComponents()
        components.host = "example.com"
        components.scheme = "https"
        components.path = "/index.html"
        components.queryItems = collection.items
        
        XCTAssertEqual(components.url?.absoluteString,
                       "https://example.com/index.html?foo=foo&bar=baz")
    }

    static var allTests = [
        ("testLinuxTestSuiteIncludesAllTests",
         testLinuxTestSuiteIncludesAllTests),
        ("testCreatingQueryItemCollectionManually",
         testCreatingQueryItemCollectionManually),
        ("testCreatingQueryItemCollectionWithDictionaryLiteral",
         testCreatingQueryItemCollectionWithDictionaryLiteral),
        ("testCreatingQueryItemCollectionWithNilValue",
         testCreatingQueryItemCollectionWithNilValue),
        ("testAppendingQueryItems", testAppendingQueryItems)
    ]
}
