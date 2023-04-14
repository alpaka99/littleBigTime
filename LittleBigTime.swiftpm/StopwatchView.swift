//
//  StopwatchView.swift
//  LittleBigTime
//
//  Created by Sebin Kwon on 2023/04/08.
//

import SwiftUI

struct ColorManager {
    static let waterColor = Color("waterColor")
}

struct StopwatchView: View {
    @State private var time = 0
    @State private var isRunning = false
    @State private var isDoing = false
    @State private var gotoFinish = false
    @State private var timer: Timer?
//    @State private var tododata: [ListItem] = []
    @State private var insetAmount = 200.0
    
    @EnvironmentObject var todolist: TodoList
    @ObservedObject var timelist = TimeList()
    
    @Binding var todo: String
    @Binding var rootIsActive: Bool
    
    //    init(todo: Binding<String> = .constant(""), rootIsActive: Binding<Bool> = .constant(false)) {
    //        _todo = todo
    //        _rootIsActive = rootIsActive
    //    }
    
    var body: some View {
        VStack {
            //            Text(todo)
            //                .font(.custom("HelveticaNeue", size: 60))
            //                .fontWeight(.ultraLight)
            //                .padding(.bottom, 200.0)
            Text("Read a book")
                .font(.custom("HelveticaNeue", size: 60))
                .fontWeight(.ultraLight)
                .padding(.bottom, 100.0)
            
            ZStack {
                // MARK: 도형
                Pentagon(insetAmount: insetAmount)
                    .frame(minWidth: 200, idealWidth: 450, maxWidth:600, minHeight: 200, idealHeight: 450, maxHeight: 600, alignment: .center)
                    .foregroundColor(ColorManager.waterColor)
                
                // MARK: 시간
                Text("\(String(time))s")
                    .font(.custom("HelveticaNeue", size: 100))
                    .fontWeight(.ultraLight)
                //                    .offset(y:-150)
                //                .padding(.vertical, 150.0)
                
            }
            
            // MARK: 스탑워치 버튼
            Button(action: {
                if isRunning{
                    timer?.invalidate()
                } else {
                    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
                        time += 1
                    })
                }
                isRunning.toggle()
                isDoing = true
                withAnimation {
                    insetAmount = Double.random(in: 200...800)
                }
            }) {
                Text(isRunning ? "Stop" : "Start")
                    .font(.custom("HelveticaNeue", size: 26))
                    .fontWeight(.light)
                    .padding(.horizontal, 45.0)
                    .padding(.vertical)
                    .background(Capsule().strokeBorder())
                    .accentColor(isRunning ? .red : .blue)
                    .animation(.easeInOut, value: isRunning)
            }
            .padding(.top, 100)
            
            // MARK: Finish 버튼
            finishBtn
            
        }
    }
    
    // 할일 다 끝내고 Finish 했을 때의 버튼
    var finishBtn: some View {
        // FinishView로 가기
        //        NavigationLink(destination: FinishView(time: $time), isActive: $gotoFinish) {
        NavigationLink(destination: FinishView(rootIsActive: $rootIsActive), isActive: $gotoFinish) {
            
            Button(action: {
                gotoFinish = true
                // 스탑워치 멈추기
                timer?.invalidate()
                isRunning = false
                // 유저의 할일과 시간 저장??
//                todolist.append(todo)
                todolist.addItem(TodoData(todo: todo, time: time))
//                timelist.append(time)
//                tododata.append(ListItem(todo: todo, time: time))
            }) {
                Text("Finish")
                    .font(.custom("HelveticaNeue", size: 26))
                    .fontWeight(.light)
                    .padding(.horizontal, 45.0)
                    .padding(.vertical)
                    .background(Capsule().strokeBorder())
                    .accentColor(isDoing ? .green : .gray)
                    .animation(.easeInOut, value: isDoing)
            }
        }
    }
}

//class TodoList: ObservableObject, Identifiable {
//    @Published var todolist: [String] = []
//    var id: UUID = UUID()
//}

class TimeList: ObservableObject, Identifiable {
    @Published var timelist: [Int] = []
    var id: UUID = UUID()
}

//class ListItem: ObservableObject, Identifiable {
//    @Published var todo: String
//    @Published var time: Int
//    var id: UUID = UUID()
//
//    init(todo: String, time: Int) {
//        self.todo = todo
//        self.time = time
//    }
//}

struct Pentagon: Shape {
    var insetAmount: Double
    
    func path(in rect: CGRect) -> Path {
        //        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        
        let radius = 0.5 * min(width, height) // Radius of the circumscribed circle
        //                let apothem = 0.5 * radius * CGFloat(tan(Double.pi / 5.0)) // Apothem length
        
        var path = Path()
        let startPoint = CGPoint(x: rect.midX, y: rect.minY + radius) // Starting point at the top center of the rectangle
        path.move(to: startPoint)
        
        for index in 1...6 {
            let angle = CGFloat(index) * 2.0 * .pi / 5.0
            let x = startPoint.x + radius * sin(angle)
            let y = startPoint.y + radius * cos(angle)
            let point = CGPoint(x: x, y: y)
            path.addLine(to: point)
        }
        
        path.closeSubpath()
        return path
    }
}

//struct StopwatchView_Previews: PreviewProvider {
//    static var previews: some View {
//        StopwatchView()
//    }
//}
