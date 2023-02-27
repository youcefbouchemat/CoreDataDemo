//
//  ContentView.swift
//  CoreDataDemo
//
//  Created by apple on 27/2/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    enum FocusedField{
        case name, quantity
    }
    
    @State private var name:String = "";
    @State private var quantity:String = "";
    @FocusState private var focusState:FocusedField?
    
    @Environment(\.managedObjectContext) private var viewContext;
    
    @FetchRequest(entity: Product.entity(), sortDescriptors: [
    NSSortDescriptor(key: "name", ascending: true)])
    
    private var products: FetchedResults<Product>
    
    var body: some View {
        NavigationView {
            VStack {
                
                TextField("Product Name", text: $name)
                    .focused($focusState, equals: .name)
                TextField("Product Quantity", text: $quantity)
                    .focused($focusState, equals: .quantity)
                
                
                HStack{
                    Spacer()
                    
                    Button("Add"){
                        addProduct();
                    }
                    Spacer()
                    
                    Button("Clear"){
                        name = "";
                        quantity = "";
                    }
                    Spacer()
                }
                List {
                    ForEach(products) { product in
                        HStack{
                            Text(product.name ?? "Not Found")
                            Spacer()
                            Text(product.quantity ?? "Not Found")
                        }
                    }
                }
                .navigationTitle("Product Database")
            }
            .padding()
            .textFieldStyle(.roundedBorder)
        }
    }
    
    private func addProduct(){
        withAnimation {
            let product = Product(context: viewContext);
            
            product.name = name;
            product.quantity = quantity;
            
            saveContext()
        }
    }
    
    private func saveContext(){
        do{
            try viewContext.save();
            name = "";
            quantity = "";
            focusState = .name
        }catch{
            let error = error as NSError
            fatalError("An error occured: \(error)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
