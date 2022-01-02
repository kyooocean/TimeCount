//
//  SetView.swift
//  Timer
//
//  Created by Kyohei Morinaka on 2022/01/02.
//

import SwiftUI

struct SetView: View {
    @AppStorage("time_value") var timeValue = 10
    var body: some View {
        ZStack {
            Color("setBack")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text("\(timeValue)")
                    .font(.largeTitle)
                Spacer()
                Picker(selection: $timeValue) {
                    Text("10").tag(10)
                    Text("20").tag(20)
                    Text("30").tag(30)
                    Text("40").tag(40)
                    Text("50").tag(50)
                    Text("60").tag(60)
                } label: {
                    Text("SELECT")
                }
                .pickerStyle(.wheel)
                Spacer()
            }
        }
    }
}

struct SetView_Previews: PreviewProvider {
    static var previews: some View {
        SetView()
    }
}
