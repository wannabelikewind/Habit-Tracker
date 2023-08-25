//
//  AddView.swift
//  Habit Tracker
//
//  Created by Devansh Agrawal on 23/08/23.
//

import SwiftUI
import Liquid

struct AddView: View {
    @ObservedObject var tasks : Tasks
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var description = ""
    @State private var count = 0
    
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Liquid(samples: 8, period: 15.0)
                    .frame(width : geometry.size.width,height: geometry.size.height)
                    .foregroundColor(.cyan)
                    .opacity(0.2)
                    .blur(radius: 15)
                Liquid(samples: 3, period: 6.00)
                    .frame(width : geometry.size.width * 0.9,height: geometry.size.height )
                    .foregroundColor(.purple)
                    .opacity(0.3)
                    .blur(radius: 4)
                Liquid(samples: 3, period: 10.0)
                    .frame(width : geometry.size.width * 0.9,height: geometry.size.height * 0.8)
                    .foregroundColor(.blue)
                    .opacity(0.2)
                    .blur(radius: 5)
                Liquid(samples: 5, period: 8.00)
                    .frame(width : geometry.size.width * 0.5,height: geometry.size.height * 0.4)
                    .foregroundColor(.pink)
                    .opacity(0.4)
                    .blur(radius: 2)
                
                    NavigationView{
                        Form{
                            TextField("Name",text: $name)
                            
                            TextField("Description",text: $description)
                        }
                        .navigationTitle("Add your track")
                        .toolbar{
                            Button{
                                let item = Task(name: name,description: description, count: count)
                                tasks.items.append(item)
                                dismiss()
                            }label: {
                                Text("Save")
                            }
                        }
                    }
                    .opacity(0.7)
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(tasks: Tasks())
    }
}
