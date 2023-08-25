//
//  ContentView.swift
//  Habit Tracker
//
//  Created by Devansh Agrawal on 21/08/23.
//

import SwiftUI
import Liquid

struct ContentView: View {
    @StateObject var tasks = Tasks()
    @State private var showingAddTask = false
    
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
                    List{
                        ForEach(tasks.items){item in
                            
                            NavigationLink {
                                DetailView(tasks: tasks, task: item)                        } label: {
                                    HStack{
                                        Text(item.name)
                                    }
                                }
                        }
                        .onDelete(perform: removeItems)
                    }
                    .navigationTitle("Habit Tracker")
                    .toolbar{
                        Button{
                            showingAddTask = true
                        }label: {
                            Image(systemName: "plus")
                        }
                    }
                    .sheet(isPresented: $showingAddTask){
                        AddView(tasks: tasks)
                    }
                }
                
            }
            
        }
        .opacity(0.7)
    }
    
    
    func removeItems(at offSets : IndexSet){
        tasks.items.remove(atOffsets: offSets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
