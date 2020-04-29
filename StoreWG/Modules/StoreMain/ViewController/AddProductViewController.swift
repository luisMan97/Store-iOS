//
//  AddProductViewController.swift
//  StoreWG
//
//  Created by Jorge Luis Rivera Ladino on 28/04/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

class AddProductViewController: UIViewController {

    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.cornerRadiusWith(borderColor: UIColor.white.cgColor, borderWidth: 0, cornerRadius: 20)
        }
    }
    @IBOutlet weak var productTextField: UITextField!
    
    let viewModel = AddProductViewModel()
    var updateStoreView : (([Counter]) -> ())?
    
    @IBAction func closeView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addProduct(_ sender: Any) {
        addProduct()
    }
    
    private func addProduct() {
        viewModel.addCounter(title: productTextField.text) { [weak self] (success, error) in
            guard let strongSelf = self else { return }
            
            if let error = error {
                strongSelf.presentAlertError(error)
            } else if let success = success {
                if success {
                    DispatchQueue.main.async {
                        strongSelf.updateStoreView?(strongSelf.viewModel.counterList)
                        strongSelf.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }

}
