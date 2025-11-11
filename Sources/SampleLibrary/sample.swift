#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

public struct SampleStruct: Identifiable {

    public let id: String
    public let count: UInt
    public let score: Double
    
    public init(count: UInt, score: Double) {
        self.id = UUID().uuidString
        self.count = count
        self.score = score
    }

    /// A sample method that does something.
    public func sampleMethod() {
        // Implementation goes here
    }
}

extension SampleStruct: CustomStringConvertible {
    public var description: String {
        return "SampleStruct(id: \(id), count: \(count), score: \(score))"
    }
}

public enum SampleError: Error {
    case invalidCount
    case computationFailed(reason: String)
}

public actor SampleActor {
    private var internalState: [String: Int] = [:]
    
    public func updateState(forKey key: String, value: Int) {
        internalState[key] = value
    }
    
    public func getState(forKey key: String) -> Int? {
        return internalState[key]
    }
}

public class SampleClass {
    public var name: String
    public var isActive: Bool
    
    public init(name: String, isActive: Bool) {
        self.name = name
        self.isActive = isActive
    }
    
    public func toggleActive() {
        isActive.toggle()
    }
}