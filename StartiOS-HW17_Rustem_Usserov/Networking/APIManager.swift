//
//  Networking.swift
//  StartiOS-HW17_Rustem_Usserov
//
//  Created by Rustem on 02.06.2024.
//

import Foundation
import Alamofire

class APIManager {
    static let shared = APIManager()

    func fetchCards(completion: @escaping (Result<[Card], Error>) -> Void) {
        AF.request("https://api.magicthegathering.io/v1/cards").responseDecodable(of: CardResponse.self) { response in
            switch response.result {
                case .success(let cardResponse):
                    completion(.success(cardResponse.cards))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
