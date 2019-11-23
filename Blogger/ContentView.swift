//
//  ContentView.swift
//  Blogger
//
//  Created by Frank Bara on 11/21/19.
//  Copyright © 2019 BaraLabs. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Big.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Big.name, ascending: true),
        NSSortDescriptor(keyPath: \Big.carrier, ascending: true),
        NSSortDescriptor(keyPath: \Big.saved, ascending: true)
    ]) var bigger: FetchedResults<Big>
    
    @State private var save: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(bigger, id: \.name) { big in
                    ZStack {
                        Rectangle().fill(Color.white)
                            .frame(width: UIScreen.main.bounds.width - 32, height: 70)
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 4)
                        
                        HStack {
                            Image(systemName: "person.circle.fill")
                                .font(.system(size: 45))
                                .foregroundColor(.red)
                            
                            VStack(alignment: .leading) {
                                Text("\(big.name ?? "")")
                                    .font(.headline)
                                
                                Text("\(big.carrier ?? "")")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            
                            Button(action: {
                                big.saved.toggle()
                                try? self.moc.save()
                            }) {
                                Image(systemName: big.saved ? "bookmark.fill" : "bookmark")
                            }
                            
                        }.padding()
                    }
                }
            }
        }.navigationBarTitle("Creators")
            .navigationBarItems(trailing: Button(action: {self.save.toggle()}) { Image(systemName: "plus.circle.fill")})
            .sheet(isPresented: $save) {
                AddNew().environment(\.managedObjectContext, self.moc)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
