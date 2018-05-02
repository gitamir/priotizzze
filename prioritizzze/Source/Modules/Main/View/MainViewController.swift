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
                .startWithValues { [weak self] _ in
                    self?.tableView?.reloadData()
                }
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "MainCell", bundle: nil), forCellReuseIdentifier: "MainCell")
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.entities.value.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as? MainCell {
            cell.viewModel = MainCellModel viewModel?.entities.map { $0[indexPath.row] }
            
            return cell
        }
        
        return UITableViewCell()
    }
}
