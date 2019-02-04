//
//  ErrorColor.swift
//  Pods
//
//  Created by Pedro Eduardo Waquim on 01/02/2019.
//

import UIKit

@objc public enum CBErrorColor: Int, RawRepresentable{
    case RED
    case BLACK
    
    public typealias RawValue = UIColor
    
    public var rawValue: RawValue{
        switch self {
        case .BLACK:
            return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        default:
            return #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        }
    }
    
    public init?(rawValue: CBErrorColor.RawValue) {
        switch rawValue {
        case #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1):
            self = .BLACK
        default:
            self = .RED
        }
        
    }
}
