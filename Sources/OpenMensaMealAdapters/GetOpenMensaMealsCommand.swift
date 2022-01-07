//
//  File.swift
//  
//
//  Created by Prof. Dr. Nunkesser, Robin on 07.01.22.
//

import Foundation
import MealPorts

public class GetOpenMensaMealsCommand : GetMealsCommand {
    
    public init() {
    }
    
    public func execute(inDTO: MealQuery) async throws -> Array<MealCollection> {
        let meals = try await OpenMensaDataSource(mensa: inDTO.mensa, date: inDTO.date).retrieveAll()
        
        var collections : [MealCategory:MealCollection] = [:]
        
        for meal in meals {
            if !collections.keys.contains(meal.category) {
                collections[meal.category] = OpenMensaMealCollection(category: meal.category, meals: [])
            }
            collections[meal.category]!.meals.append(meal)
        }
        let values = Array(collections.values)
        return values
        
    }
    
    
}
