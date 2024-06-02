//
//  Cards.swift
//  StartiOS-HW17_Rustem_Usserov
//
//  Created by Rustem on 02.06.2024.
//

import Foundation

struct Card: Decodable{
    let name: String
    let type: String
    let rarity: String
    let setName: String
    let imageUrl: String?
}
