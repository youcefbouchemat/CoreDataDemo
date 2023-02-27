//
//  ResultsView.swift
//  CoreDataDemo
//
//  Created by apple on 27/2/2023.
//

import SwiftUI
import CoreData

struct ResultsView: View {
    
    var name: String
    var viewContext: NSManagedObjectContext
    
    @State private var matches: [Product]?
    
    var body: some View {
        VStack{
            List{
                ForEach(matches ?? []) { product in
                    HStack{
                        Text(product.name ?? "Not Found")
                        Spacer()
                        Text(product.quantity ?? "Not Found")
                    }
                }
            }
            .navigationTitle("Results")
        }
        .task {
            let fetchRequest: NSFetchRequest<Product> = Product.fetchRequest()
            
            fetchRequest.entity = Product.entity()
            fetchRequest.predicate = NSPredicate(format: "name CONTAINS %@", name)
            
            matches = try? viewContext.fetch(fetchRequest)
        }
    }

}
