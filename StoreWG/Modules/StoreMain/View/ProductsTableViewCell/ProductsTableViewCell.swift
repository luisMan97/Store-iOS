//
//  ProductsTableViewCell.swift
//  StoreWG
//
//  Created by Jorge Luis Rivera Ladino on 28/04/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var counterlabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var borderButtons: UIView! {
        didSet {
            borderButtons.cornerRadiusWith(borderColor: UIColor.red.cgColor, borderWidth: 1, cornerRadius: 10)
        }
    }
    
    var counter: Counter? {
        didSet{
            setup()
        }
    }
    
    var decCounter : ((UITableViewCell) -> ())?
    var incCounter : ((UITableViewCell) -> ())?
    
    private var viewModel: ProductViewModel {
        return ProductViewModel(counter: counter)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    @IBAction func removeAction(_ sender: Any) {
        decCounter?(self)
    }
    
    @IBAction func addAction(_ sender: Any) {
        incCounter?(self)
    }
    
    private func setup() {
        productNameLabel.text = counter?.title
        counterlabel.text = String(counter?.count ?? 0)
    }
    
}
