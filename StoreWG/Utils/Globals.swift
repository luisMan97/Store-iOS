//
//  Globals.swift
//  StoreWG
//
//  Created by Jorge Luis Rivera Ladino on 28/04/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

// Typealias

typealias CallServiceHandler = ((_ onSuccess: Bool?, _ onError: Error?) -> Void)?
typealias CallServiceHandlerWithData = ((_ data: Data?, _ onError: Error?) -> Void)?
typealias AlertActionHandler = ((UIAlertAction) -> Void)?
