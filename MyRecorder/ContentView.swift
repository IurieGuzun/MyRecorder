//
//  ContentView.swift
//  MyRecorder
//
//  Created by Iurie Guzun on 2022-01-30.
//
//  https://blckbirds.com/post/voice-recorder-app-in-swiftui-1/
//  https://stackoverflow.com/questions/54152300/how-to-make-waveform-for-my-recorded-audio
//  https://www.raywenderlich.com/21672160-avaudioengine-tutorial-for-ios-getting-started
import SwiftUI

struct ContentView: View {
    
//    @State  var toggleRecordStop = "Record"
    @State  var toggleRecordStop = ""
    @State  var counter = Text("0:00")
    
    @ObservedObject var audioRecorder: AudioRecorder
    var body: some View {
        NavigationView {
            VStack {
                RecordingsList(audioRecorder: audioRecorder)
                Spacer()
                counter
                    .font(.system(size: 20))
                Spacer()
                if audioRecorder.recording == false {
                    Button(action: {
                        print("Start recording")
                        self.audioRecorder.startRecording()
                        counter = Text(Date().addingTimeInterval(0.0), style: .timer)
//                        toggleRecordStop = "Stop"
                     }) {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipped()
                            .foregroundColor(.red)
                            .padding(.bottom, 40)
                            .overlay(Text(toggleRecordStop))
                        
                    }
                } else {
                    Button(action: {
                        print("Stop recording)")
//                        toggleRecordStop = "Record"
                        self.audioRecorder.stopRecording()
                        counter = Text("0:00")
                       
                    }) {
                        Image(systemName: "stop.fill")
                             .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipped()
                            .foregroundColor(.orange)
                            .padding(.bottom, 40)
                            .overlay(Text(toggleRecordStop))
                    }
                }
            }
            .navigationBarTitle("Voice Recorder")
            .navigationBarItems(leading:  EditButton())
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(audioRecorder: AudioRecorder())
    }
}
