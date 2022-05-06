//
//  TimePickerSheet.swift
//  BreakTime
//
//  Created by Jaehwa Noh on 2022/05/04.
//

import SwiftUI

struct TimePickerSheet: View {
    
    @State private var currentDate = Date()
    @Binding var isShowSheet: Bool
    @Binding var myBreakTime: BreakTime
    
    
    @FocusState private var keyboardFocus: Bool
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("언제 쉴까?").font(.title2)
                    DatePicker("", selection: $currentDate, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(.wheel)
                    if !(self.myBreakTime.durationMinute >= 1 && self.myBreakTime.durationMinute <= 60) {
                        Text("1~60 분 사이의 값을 사용해야 합니다.")
                            .foregroundColor(.red)
                    }
                    
                    HStack {
                        Text("얼마나 쉴까?:").font(.title2)
                        TextField("1~60 분", value: self.$myBreakTime.durationMinute, formatter: NumberFormatter()).font(.title2).multilineTextAlignment(.trailing)
                            .focused($keyboardFocus)
                            .keyboardType(UIKeyboardType.numberPad)
                        Text("분").font(.title2)
                        //                    Spacer(minLength: 120)
                    }
                    Text("메모").padding(.top, 20).font(.title2)
                    TextEditor(text: self.$myBreakTime.memo)
                        .focused($keyboardFocus)
                        .frame(height: 200)
                    
                    Spacer()
                    
                }
                .padding(.horizontal,15)
                .onAppear {
                    UIScrollView.appearance().isScrollEnabled = true
                }
                .onDisappear {
                    UIScrollView.appearance().isScrollEnabled = false
                }
                .navigationTitle("시간 설정")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button {
                            isShowSheet = false
                        } label: {
                            Text("취소")
                        }
                    }
                    
                    ToolbarItem(placement: .confirmationAction) {
                        Button {
                            isShowSheet = false
                            let calendar = Calendar.current
                            let hour = calendar.component(.hour, from: currentDate)
                            self.myBreakTime.startHour = hour
                            let minute =
                            calendar.component(.minute, from: currentDate)
                            self.myBreakTime.startMinute = minute
                        } label: {
                            Text("저장")
                        }.disabled(!(self.myBreakTime.durationMinute >= 1 && self.myBreakTime.durationMinute <= 60))
                    }
                }
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("완료") {
                            self.keyboardFocus = false
                        }
                    }
                }
            }
        }
        
        
    }
}

struct TimePickerSheet_Previews: PreviewProvider {
    static var previews: some View {
        TimePickerSheet(isShowSheet: ContentView.init(myBreakTime: BreakTime(), showModal: false).$showModal, myBreakTime: ContentView.init(myBreakTime: BreakTime(), showModal: false).$myBreakTime)
    }
}
