//
//  UIViewExtension.swift
//  StoreWG
//
//  Created by Jorge Luis Rivera Ladino on 28/04/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

extension UIView {
    
    func roundSides() {
        layer.cornerRadius = bounds.height / 2
    }
    
    func cornerRadiusWith(borderColor: CGColor, borderWidth: CGFloat, cornerRadius: CGFloat)  {
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
    
    // MARK: - Load nib for cell
    
    public class var nib: UINib? {
        if let _ = Bundle.main.path(forResource: nibName, ofType: "nib") {
            return UINib(nibName: nibName, bundle: nil)
        } else {
            return nil
        }
    }
    
    // MARK: - Load nib
    
    public class var nibName: String {
        let name = String(describing: self).components(separatedBy: ".").first ?? ""
        return name
    }

}
