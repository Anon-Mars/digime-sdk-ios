//
//  ServiceType.swift
//  DigiMeSDK
//
//  Created on 06/06/2021.
//  Copyright © 2021 digi.me Limited. All rights reserved.
//

import Foundation

public struct ServiceType: Encodable {
    let identifier: UInt
    let serviceObjectTypes: [ServiceObjectType]
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case serviceObjectTypes
    }
    
    public init(identifier: UInt, objectTypes: [ServiceObjectType]) {
        self.identifier = identifier
        self.serviceObjectTypes = objectTypes
    }
}