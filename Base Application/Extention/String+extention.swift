//
//  String+extention.swift
//  Base Application
//
//  Created by Ahsanul Kabir on 17/2/21.
//  Copyright © 2021 sakibwrold. All rights reserved.
//

import Foundation

extension String{
    func localize() -> String{
        return NSLocalizedString(self,
                                 tableName: "Localizable" ,
                                 bundle: .main,
                                 value: self,
                                 comment: self)
    }
}
