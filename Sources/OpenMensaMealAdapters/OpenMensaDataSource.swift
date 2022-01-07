//
//  File.swift
//  
//
//  Created by Prof. Dr. Nunkesser, Robin on 07.01.22.
//

import Foundation
import CommonPorts
import MealPorts
import OpenMensaInfrastructure

public class OpenMensaDataSource : DataSource {
    public typealias idType = Int
    public typealias entityType = MealPorts.Meal
    
    var mensa: Int
    var date: Date
    var api = OpenMensaAPI()
    
    public init(mensa: Int, date: Date) {
        self.mensa = mensa
        self.date = date
    }
    
    public func retrieve(id: Int) async throws -> MealPorts.Meal {
        throw fatalError("Not implemented")
    }
    
    public func retrieveAll() async throws -> [MealPorts.Meal] {
        let meals = try await api.getMeals(for: mensa, on: date)
        return meals.map({
            meal in
            var category = MealCategory.dish
            switch meal.category {
            case "Desserts": category = MealCategory.dessert
            case "Beilagen": category = MealCategory.sidedish
            default:
                category = MealCategory.dish
            }
            return OpenMensaMeal(name: meal.name, image: "", price: OpenMensaPrice(students: meal.prices.students, employees: meal.prices.employees, pupils: meal.prices.pupils, others: meal.prices.others), allergens: .none, additives: .none, category: category)
        })
    }

    
}
