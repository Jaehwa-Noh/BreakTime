//
//  ContentView.swift
//  BreakTime
//
//  Created by Jaehwa Noh on 2022/04/30.
//

import SwiftUI

struct ContentView: View {
    
    @State var myBreakTime = BreakTime()
    @State var showModal = false
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("학교 종이 땡땡땡")
                .font(.title)
                .padding(.vertical, 8)
            
            
            List {
                Button {
                    print("hi")
                    self.showModal = true
                } label: {
                    VStack {
                        HStack {
                            if myBreakTime.startHour >= 12 && myBreakTime.startHour < 24 {
                                Text("오후")
                                    .foregroundColor( myBreakTime.isTurnOn ? Color(.sRGB, red: 0.0, green: 0, blue: 0, opacity: 1) : Color(white: 0.5))
                            } else {
                                Text("오전")
                                    .foregroundColor( myBreakTime.isTurnOn ? Color(.sRGB, red: 0.0, green: 0, blue: 0, opacity: 1) : Color(white: 0.5))
                            }
                            Text("\(myBreakTime.startHour):\(String(format: "%02d", myBreakTime.startMinute))")
                                .foregroundColor( myBreakTime.isTurnOn ? Color(.sRGB, red: 0.0, green: 0, blue: 0, opacity: 1) : Color(white: 0.5))
                            
                            Toggle("", isOn: $myBreakTime.isTurnOn)
                            
                        }.font(.title)
                        Text("\(myBreakTime.memo)")
                            .multilineTextAlignment(.leading)
                            .foregroundColor( myBreakTime.isTurnOn ? Color(.sRGB, red: 0.0, green: 0, blue: 0, opacity: 1) : Color(white: 0.5))
                        
                    }
                }
                .sheet(isPresented: $showModal) {
                    TimePickerSheet(isShowSheet: $showModal, myBreakTime: $myBreakTime)
                }
                
                
//                if myBreakTime.isTurnOn {
//                    Text("Hello")
//
//                } else {
//                    Text("Good")
//                }
                
                
                
            }
            .onAppear {
                UIScrollView.appearance().isScrollEnabled = false
            }
            .onDisappear {
                UIScrollView.appearance().isScrollEnabled = true
            }
            .listStyle(.plain)
            
            
            Spacer()
            
        }.padding(.horizontal, 15)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//List {
//    ForEach(0..<3) { index in
//        Button {
//            print("hi")
//        } label: {
//            testBody
//        }
//    }
//}
//.listStyle(.plain)
