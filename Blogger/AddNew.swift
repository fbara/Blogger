//
//  AddNew.swift
//  Blogger
//
//  Created by Frank Bara on 11/22/19.
//  Copyright © 2019 BaraLabs. All rights reserved.
//

import SwiftUI

struct AddNew: View {
    @Environment(\.managedObjectContext) var moc
    
    @State private var name: String = ""
    @State private var carrier: String = ""
    
    @State private var saved: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                VStack {
                    TextField("name...", text: self.$name)
                        .padding()
                        .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0))
                    
                    TextField("carrier...", text: self.$carrier)
                    .padding()
                    .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0))
                    
                    Button(action: {
                        let add = Big(context: self.moc)
                        add.name = self.name
                        add.carrier = self.carrier
                        add.saved = self.saved
                        
                        try? self.moc.save()
                        
                        self.name = ""
                        self.carrier = ""
                    }) {
                        Text("Add new...")
                        .padding()
                            .font(.system(size: 23))
                            .foregroundColor((self.name.count > 0 && self.carrier.count > 0) ? Color.white : Color.gray)
                        
                    }.background(Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
    }
}

struct AddNew_Previews: PreviewProvider {
    static var previews: some View {
        AddNew()
    }
}
