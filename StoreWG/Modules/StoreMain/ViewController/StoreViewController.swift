//
//  StoreViewController.swift
//  StoreWG
//
//  Created by Jorge Luis Rivera Ladino on 28/04/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController {
    
    @IBOutlet weak var productsTableView: UITableView!  {
        didSet {
            productsTableView.register(ProductsTableViewCell.nib, forCellReuseIdentifier: "cell")
            productsTableView.rowHeight = 65
            productsTableView.tableFooterView = UIView()
        }
    }
    @IBOutlet weak var counterTotal: UILabel!
    
    var viewModel = StoreViewModel()
    
    fileprivate(set) lazy var emptyStoreView: UIView = {
        guard let view = Bundle.main.loadNibNamed("EmptyStore", owner: nil, options: [:])?.first as? UIView else {
            return UIView()
        }
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        getCounters()
        navigationItem.leftBarButtonItem = editButtonItem
        editButtonItem.tintColor = .red
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addProductVC = segue.destination as? AddProductViewController {
            addProductVC.updateStoreView = { [weak self] counterList in
                self?.viewModel.counterList = counterList
                self?.productsTableView.reloadData()
            }
        }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        productsTableView.setEditing(editing, animated: animated)
    }
    
    private func getCounters() {
        viewModel.getCounters() { [weak self] (success, error) in
            guard let strongSelf = self else { return }
            
            if let error = error {
                strongSelf.presentAlertError(error)
            } else if let success = success {
                if success {
                    DispatchQueue.main.async {
                        strongSelf.productsTableView.reloadData()
                        strongSelf.counterTotal.text = strongSelf.viewModel.totalString
                    }
                }
            }
        }
    }


}

