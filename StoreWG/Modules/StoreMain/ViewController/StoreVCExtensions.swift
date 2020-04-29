//
//  StoreVCExtensions.swift
//  StoreWG
//
//  Created by Jorge Luis Rivera Ladino on 28/04/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

extension StoreViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundView =  viewModel.counterListCount == 0 ? emptyStoreView : nil
         
        return viewModel.counterListCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProductsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.counter = viewModel.counterList[indexPath.row]
        cell.decCounter = decCounter
        cell.incCounter = incCounter
        
        return cell
    }
    
}

extension StoreViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteCounter(indexPath: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        editButtonItem.title = "Done"
    }
    
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        editButtonItem.title = "Edit"
    }
    
}

private extension StoreViewController {
    func decCounter(_ cell: UITableViewCell) -> () {
        guard let indexPath = productsTableView.indexPath(for: cell) else { return }
        callDecCounter(row: indexPath.row)
    }
    
    func incCounter(_ cell: UITableViewCell) -> () {
        guard let indexPath = productsTableView.indexPath(for: cell) else { return }
        callIncCounter(row: indexPath.row)
    }

    func callDecCounter(row: Int) {
        viewModel.callDecCounter(viewModel.counterList[row]) { [weak self] (success, error) in
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
    
    func callIncCounter(row: Int) {
        viewModel.callIncCounter(viewModel.counterList[row]) { [weak self] (success, error) in
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

private extension StoreViewController {
    
    func deleteCounter(indexPath: IndexPath) {
        viewModel.deleteCounter(viewModel.counterList[indexPath.row]) { [weak self] (success, error) in
            guard let strongSelf = self else { return }
            
            if let error = error {
                strongSelf.presentAlertError(error)
            } else if let success = success {
                if success {
                    DispatchQueue.main.async {
                        strongSelf.productsTableView.deleteRows(at: [indexPath], with: .automatic)
                        strongSelf.counterTotal.text = strongSelf.viewModel.totalString
                    }
                }
            }
        }
        
    }
}
