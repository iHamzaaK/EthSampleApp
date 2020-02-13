//
//  Balance.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 13/02/2020.
//  Copyright © 2020 Hamza Khan. All rights reserved.
//

import Foundation

class Balance: Codable{
    
    let id : Int?
    let jsonrpc : String?
    let result : String?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case jsonrpc = "jsonrpc"
        case result = "result"
        
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        jsonrpc = try values.decodeIfPresent(String.self, forKey: .jsonrpc)
        result = try values.decodeIfPresent(String.self, forKey: .result)
    }
}
