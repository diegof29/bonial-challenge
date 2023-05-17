//
//  TaskResult.swift
//
//
//  Created by Diego Pais on 16.05.23.
//

public enum TaskResult<T> {
    case success(data: T)
    case failure(error: BError?)
    
    public var error: BError? {
        switch self {
        case .success: return nil
        case let .failure(error): return error
        }
    }
    
    public var data: T? {
        switch self {
        case let .success(data): return data
        case .failure: return nil
        }
    }
}
