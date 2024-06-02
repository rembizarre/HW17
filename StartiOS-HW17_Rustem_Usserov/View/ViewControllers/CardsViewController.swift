//
//  CardsViewController.swift
//  StartiOS-HW17_Rustem_Usserov
//
//  Created by Rustem on 02.06.2024.
//

import UIKit
import SnapKit

class CardsViewController: UIViewController {

    let tableView = UITableView()
    var viewModel = CardsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Magic: The Gathering Cards"
        setupTableView()
        setupBindings()
        viewModel.fetchData()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.register(CardTableViewCell.self, forCellReuseIdentifier: "CardTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func setupBindings() {
        viewModel.onDataUpdate = {[weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension CardsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardTableViewCell", for: indexPath) as? CardTableViewCell else {
            return UITableViewCell()
        }
        let card = viewModel.cards[indexPath.row]
        cell.configure(with: card)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let card = viewModel.cards[indexPath.row]
        let detailViewController = CardDetailViewController(card: card)
        present(detailViewController, animated: true, completion: nil)
    }

}
