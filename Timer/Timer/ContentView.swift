//
//  ContentView.swift
//  Timer
//
//  Created by Kyohei Morinaka on 2022/01/02.
//

import SwiftUI

struct ContentView: View {
    let backGroundColor = LinearGradient(gradient: Gradient(colors: [.purple, .pink]), startPoint: .leading, endPoint: .trailing)
    @State var timeHandler : Timer?
    @State var count = 0
    @AppStorage("time_value") var timeValue = 10
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    backGroundColor
                        .edgesIgnoringSafeArea(.all)
                    VStack(spacing: 30) {
                        Text("\(timeValue - count)Count")
                            .font(.largeTitle)
                        HStack{
                            Button(action: {
                                startTime()
                            }) {
                                Text("START")
                                    .font(.title)
                                    .foregroundColor(Color.white)
                                    .frame(width: 140, height: 140)
                                    .background(Color("startButton"))
                                    .clipShape(Circle())
                            }
                            Button(action: {
                                if let unwrappedTimeHandler = timeHandler {
                                    if unwrappedTimeHandler.isValid == true {
                                        unwrappedTimeHandler.invalidate()
                                    }
                                }
                            }) {
                                Text("STOP")
                                    .font(.title)
                                    .foregroundColor(Color.white)
                                    .frame(width: 140, height: 140)
                                    .background(Color("endButton"))
                                    .clipShape(Circle())
                            }
                        }
                    }
                    .onAppear {
                        count = 0
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(destination: SetView()) {
                                Text("秒数を設定")
                            }
                        }
                    }
                }
            }
        }
        .navigationBarHidden(true)
        //for iPad
        .navigationViewStyle(StackNavigationViewStyle())
    }
    func countDownTime() {
        count += 1
        if timeValue - count <= 0 {
            timeHandler?.invalidate()
        }
    }
    func startTime() {
        if let unwrappedTimeHandler = timeHandler {
            if unwrappedTimeHandler.isValid == true {
                return
            }
        }
        if timeValue - count <= 0 {
            count = 0
        }
        timeHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            countDownTime()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
