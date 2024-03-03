//
//  Extensions.swift
//  Netflix Clone
//
//  Created by User on 03.03.2024.
//

import Foundation


extension String{
    func capitalizeFirstLetter() -> String{
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
