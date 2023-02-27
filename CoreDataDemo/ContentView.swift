//
//  ContentView.swift
//  CoreDataDemo
//
//  Created by apple on 27/2/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State private var name:String = "";
    @State private var quantity:String = "";
    
    @Environment(\.managedObjectContext) private var viewContext;
    
    @FetchRequest(entity: Product.entity(), sortDescriptors: [])
    
    private var products: FetchedResults<Product>
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
