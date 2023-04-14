//
//  CreateView.swift
//  LittleBigTime
//
//  Created by Sebin Kwon on 2023/04/08.
//

import SwiftUI

struct CreateView: View {
    @State private var Todo: String = ""
    @Binding var rootIsActive: Bool
    //
    //    init(rootIsActive: Binding<Bool> = .constant(false)) {
    //        _rootIsActive = rootIsActive
    //    }
    //    @Binding var firstNaviLinkActive: Bool
    
    var body: some View {
        VStack {
            Text("What do you want to do?")
                .font(.custom("HelveticaNeue", size: 60))
                .fontWeight(.ultraLight)
                .padding(.bottom, 150.0)
            Image("seed")
                .padding(.bottom, 100.0)
            TextField("Enter what you want to do", text: $Todo)
                .padding()
                .frame(minWidth:50, maxWidth: 800)
            //                    .overlay( RoundedRectangle(cornerRadius: 50) .stroke(Color.blue) )
                .background(RoundedRectangle(cornerRadius: 50).fill(Color(uiColor: .secondarySystemBackground)))
            nextBtn
//                .border(.black, width: 2)
        }
    }
    // 타이머까지 다 돌아간 후에 todo를 TodoData.todo에 append
    var nextBtn: some View {
        //        NavigationLink(destination: StopwatchView(todo: $Todo)) {
        NavigationLink(destination: StopwatchView(todo: $Todo, rootIsActive: $rootIsActive)) {
            Text("Next")
                .font(.custom("HelveticaNeue", size: 26))
                .fontWeight(.light)
                .padding(.horizontal, 45.0)
                .padding(.vertical)
                .background(Capsule().strokeBorder())
                .accentColor(isTodo() ? /*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/ : .gray)
                .animation(.easeInOut, value: isTodo())
        }
        .offset(x:330,y:100)
        .padding(.horizontal, 20)
        // 값이 없다면 비활성화
        .disabled(!isTodo())
    }
    
    func isTodo() -> Bool {
        if Todo.count == 0 {
            return false
        }
        return true
    }
    
}

//struct CreateView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateView()
//    }
//}
//
