//
//  EntityFormView.swift
//  SwiftUI Core Data Test
//
//  Created by Chuck Hartman on 8/5/19.
//  Copyright © 2019 ForeTheGreen. All rights reserved.
//

import SwiftUI

struct EntityFormView: View {
    
    @Binding var textName: String
    @Binding var textOrder: String

    var body: some View {
        
        Form {
            Section(header: Text("Entity".uppercased())) {
                
                VStack {
                    HStack {
                        Text("Name: ")
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    TextField("Enter Entity Name", text: self.$textName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                VStack {
                    HStack {
                        Text("Order: ")
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    TextField("Enter Order", text: self.$textOrder)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
        }
    }
}

#if DEBUG
struct EntityFormView_Previews : PreviewProvider {
    
    static var previews: some View {
        
        NavigationView {
            EntityFormView(textName: .constant("Item 0"), textOrder: .constant("0"))
        }
    }
}
#endif
