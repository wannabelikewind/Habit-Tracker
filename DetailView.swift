//
//  DetailView.swift
//  Habit Tracker
//
//  Created by Devansh Agrawal on 23/08/23.
//

import SwiftUI
import Liquid

struct DetailView: View {
    @ObservedObject var tasks : Tasks
    @State var task : Task
    
    @State private var animationAmount = 1.0
    
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
                    LinearGradient(
                        gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.purple.opacity(0.7)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .frame(width: geometry.size.width * 0.9,height: geometry.size.height * 0.7)
                    .opacity(0.4)
                    .cornerRadius(30)
                
                
                    Text(task.name)
                        .position(x : geometry.size.width / 2 , y : geometry.size.height / 3.5)
                        .font(.custom("UnicaOne-Regular", size: 50))

                    Text(task.description)
                    .position(x : geometry.size.width / 2 , y : geometry.size.height / 2.5)
                        .font(.custom("Sacramento-Regular", size: 30))
                
                Button(String(task.count)) {
                    if let index = tasks.items.firstIndex(of: task) {
                        print("Hello World !")
                                                var updatedTask = task
                                                updatedTask.count += 1
                                                tasks.items[index] = updatedTask
                                            }
                }


                    .padding(50)
                    .background(LinearGradient(
                        gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.purple.opacity(0.7)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(LinearGradient(
                                gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.purple.opacity(0.7)]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ))
                            .scaleEffect(animationAmount)
                            .opacity(2 - animationAmount)
                            .animation(.easeInOut(duration: 1).repeatForever(autoreverses : false), value: animationAmount)
                    )
                    .onAppear{
                        animationAmount = 2
                    }
                
            }
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(tasks: Tasks(),task: Task(name: "Sample Task", description: "This is a sample task for the preview", count: 0))
    }
}

