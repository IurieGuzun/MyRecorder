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
        NavigationView {
        VStack {
                    RecordingsList(audioRecorder: audioRecorder)
                    //...

                    if audioRecorder.recording == false {
                        Button(action: {print("Start recording")
                            self.audioRecorder.startRecording()
                        }) {
                            Image(systemName: "circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .clipped()
                                .foregroundColor(.red)
                                .padding(.bottom, 40)
                        }
                    } else {
                        Button(action: {print("Stop recording)")
                            self.audioRecorder.stopRecording()
                        }) {
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
            .navigationBarTitle("Voice recorder")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(audioRecorder: AudioRecorder())
    }
}
