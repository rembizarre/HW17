//
//  CardsViewModel.swift
//  StartiOS-HW17_Rustem_Usserov
//
//  Created by Rustem on 02.06.2024.
//

import Foundation

class CardsViewModel {
    var cards: [Card] = []
    var onDataUpdate: (() -> Void)?

    func fetchData() {
        APIManager.shared.fetchCards { [weak self] result in
            switch result {
                case .success(let cards):
                    self?.cards = cards
                    self?.onDataUpdate?()
                case .failure(let error):
                    print(error)
            }
        }
    }
}
