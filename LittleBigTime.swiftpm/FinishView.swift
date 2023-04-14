//
//  FinishView.swift
//  LittleBigTime
//
//  Created by Sebin Kwon on 2023/04/09.
//

import SwiftUI

struct FinishView: View {
//    @Binding var time: Int
    @EnvironmentObject var todolist: TodoList
    @Binding var rootIsActive: Bool
//    @Binding var todolist: TodoList
//    @Binding var timelist: TimeList
    
    //    init(time: Binding<Int> = .constant(0), rootIsActive: Binding<Bool> = .constant(false)) {
    //        _time = time
    //        _rootIsActive = rootIsActive
    //    }
    
    var body: some View {
        VStack {
            ForEach(todolist.todoItems, id: \.self) {
                todoitem in
                Text(todoitem.todo)
                    .font(.custom("HelveticaNeue", size: 100))
                    .fontWeight(.ultraLight)
            }
            
            Text("Perfect!")
                .font(.custom("HelveticaNeue", size: 100))
                .fontWeight(.ultraLight)
                .onTapGesture {
                    rootIsActive = false
//                    print($tododata)
                }
            
            //            NavigationLink(destination: ContentView()) {
            //                Text("Finish")
            //            }.navigationBarBackButtonHidden(true)
            //        }
            
        }.navigationBarBackButtonHidden(true)
        
        //    var finishBtn: some View {
        //            NavigationLink(destination: FinishView(time: $time), isActive: $gotoFinish) {
        //                Button(action: {
        //                    gotoFinish = true
        //                    timer?.invalidate()
        //                    isRunning = false
        //                }) {
        //                    Text("Finish")
        //                        .font(.custom("HelveticaNeue", size: 26))
        //                        .fontWeight(.light)
        //                        .padding(.horizontal, 45.0)
        //                        .padding(.vertical)
        //                        .background(Capsule().strokeBorder())
        //                        .accentColor(isDoing ? .green : .gray)
        //                        .animation(.easeInOut, value: isDoing)
        //                }
        //            }
        //    }
    }
    
    //struct FinishView_Previews: PreviewProvider {
    //    static var previews: some View {
    //        FinishView()
    //    }
    //}
}
