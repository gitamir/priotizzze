//
//  MainViewController.swift
//  prioritizzze
//
//  Created by Амир Нуриев on 28.04.2018.
//  Copyright © 2018 Amir Nuriev. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    public var viewModel: MainViewModel? {
        didSet {
            viewModel?
                .entities
                .producer
                .skipRepeats()
                .startWithValues { [weak self] entities in
                    self?.tableView?.visibleCells.forEach { cell in
                        if let cell = cell as? MainCell,
                            let indexPath = self?.tableView?.indexPath(for: cell) {
                            cell.updater.send(value: entities[indexPath.row])
                        }
                    }
                }
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(ofType: MainCell.self)
    }
    
    @IBAction func refreshData(_ sender: UIButton) {
        viewModel?.refreshData()
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.entities.value.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: MainCell.self, for: indexPath)
        cell.updater.send(value: viewModel?.entities.value[indexPath.row])
        return cell
    }
}

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(ofType type: T.Type, for indexPath: IndexPath) -> T {
        if let cell = dequeueReusableCell(withIdentifier: String(describing: type), for: indexPath) as? T {
            return cell
        } else {
            fatalError("Not able to dequeue cell!")
        }
    }
    
    func registerNib<T>(ofType type: T.Type) {
        let description = String(describing: T.self)
        register(
            UINib(
                nibName: description,
                bundle: nil
            ),
            forCellReuseIdentifier: description
        )
    }
}
