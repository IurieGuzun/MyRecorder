//
//  ContentView.swift
//  MyRecorder
//
//  Created by Iurie Guzun on 2022-01-30.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var audioRecorder: AudioRecorder
    var body: some View {
        VStack {
                    if audioRecorder.recording == false {
                        Button(action: {print("Start recording")}) {
                            Image(systemName: "circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .clipped()
                                .foregroundColor(.red)
                                .padding(.bottom, 40)
                        }
                    } else {
                        Button(action: {print("Stop recording)")}) {
                            Image(systemName: "stop.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .clipped()
                                .foregroundColor(.red)
                                .padding(.bottom, 40)
                        }
                    }
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(audioRecorder: AudioRecorder())
    }
}
