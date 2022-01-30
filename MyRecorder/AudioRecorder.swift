//
//  AudioRecorder.swift
//  MyRecorder
//
//  Created by Iurie Guzun on 2022-01-30.
//

import Foundation
import SwiftUI
import Combine
import AVFoundation

class AudioRecorder: ObservableObject {
    
    let objectWillChange = PassthroughSubject<AudioRecorder, Never>()

    var audioRecorder: AVAudioRecorder!
    
    var recording = false {
            didSet {
                objectWillChange.send(self)
            }
        }
}
