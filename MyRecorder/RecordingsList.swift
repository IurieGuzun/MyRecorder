//
//  RecordingsList.swift
//  MyRecorder
//
//  Created by Iurie Guzun on 2022-01-30.
//

import SwiftUI

struct RecordingsList: View {
    
    //    @State private var selection: String? //Added by Iurie
    
    @ObservedObject var audioRecorder: AudioRecorder
    
    var body: some View {
        List {
            ForEach(audioRecorder.recordings, id: \.createdAt) { recording in
                //                Text("\.createdAt")
                RecordingRow(audioURL: recording.fileURL)
            }
            .onDelete(perform: delete)
        }
    }
    func delete(at offsets: IndexSet) {
        
        var urlsToDelete = [URL]()
        for index in offsets {
            urlsToDelete.append(audioRecorder.recordings[index].fileURL)
        }
        audioRecorder.deleteRecording(urlsToDelete: urlsToDelete)
    }
}


struct DetailView: View {
    
    @ObservedObject var audioPlayer = AudioPlayer()
    
    let record: URL
    
    var body: some View {
        VStack {
            Text(removeLast4(input: "\(record.lastPathComponent)") ?? "")
            
            
            if audioPlayer.isPlaying == false {
                Button(action: {
                    print("Start playing audio")
                    self.audioPlayer.startPlayback(audio: self.record)
                }) {
                    Image(systemName: "play.circle")
                        .imageScale(.large)
                }

            } else {
                Button(action: {
                    print("Stop playing audio")
                    self.audioPlayer.stopPlayback()
                }) {
                    Image(systemName: "stop.fill")
                        .imageScale(.large)
                }
            }
            
        }
        .toolbar {
            Button(action: shareButton) {
                Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.black)
            }
        }

    }
        func shareButton() {
            let url = URL(string: "\(self.record)")
            let activityController = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
    
            UIApplication.shared.windows.first?.rootViewController!.present(activityController, animated: true, completion: nil)
        }

}

struct RecordingRow: View {
    @ObservedObject var audioPlayer = AudioPlayer()
    var audioURL: URL
    
    
    var body: some View {
        HStack {
            NavigationLink(destination: DetailView(record: audioURL)) {
                Text(removeLast4(input: "\(audioURL.lastPathComponent)") ?? "")
            }
            Spacer()
        }
    }
}

struct RecordingsList_Previews: PreviewProvider {
    static var previews: some View {
        RecordingsList(audioRecorder: AudioRecorder())
    }
}
