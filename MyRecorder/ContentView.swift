//
//  ContentView.swift
//  MyRecorder
//
//  Created by Iurie Guzun on 2022-01-30.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: String?   //Added by Iurie
    
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
            .navigationBarItems(leading:  EditButton())
//            .toolbar {
//                Button(action: shareButton) {
//                    Image(systemName: "square.and.arrow.up")
//                            .foregroundColor(.black)
//                }
//            }
            
        }
    }
    func shareButton() {
            let url = URL(string: "https://designcode.io")
            let activityController = UIActivityViewController(activityItems: [url!], applicationActivities: nil)

            UIApplication.shared.windows.first?.rootViewController!.present(activityController, animated: true, completion: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(audioRecorder: AudioRecorder())
    }
}
