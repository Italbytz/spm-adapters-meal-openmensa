//
//  File.swift
//  
//
//  Created by Prof. Dr. Nunkesser, Robin on 07.01.22.
//

import Foundation
import MealPorts

struct OpenMensaMeal : Meal {
    var name: String
    
    var image: String
    
    var price: Price
    
    var allergens: Allergens
    
    var additives: Additives
    
    var category: MealCategory
    
    
}
