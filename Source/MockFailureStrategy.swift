//
//  MockFailureStrategy.swift
//  Cuckoo-iOS

import Foundation

public protocol MockFailureStrategy {
    func fail(message: String, sourceLocation: SourceLocation)
}

public struct DefaultMockFailureStrategy: MockFailureStrategy {
    public func fail(message: String, sourceLocation: SourceLocation) {

        #if _runtime(_ObjC)
            NSException(name: .internalInconsistencyException, reason:message, userInfo: nil).raise()
        #endif

        fatalError(message)
    }
}
